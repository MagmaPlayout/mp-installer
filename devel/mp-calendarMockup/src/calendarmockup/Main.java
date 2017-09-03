package calendarmockup;

import java.io.IOException;
import java.time.Duration;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import redis.clients.jedis.Jedis;
import us.monoid.json.JSONArray;
import us.monoid.json.JSONException;
import us.monoid.json.JSONObject;
import us.monoid.web.Resty;

/**
 *  Borra todas las occurrence.
 *  Agrega todos los clips, uno atrás del otro, a X minutos después de la hora actual.
 *  Manda un comando CALCHANGE al core para que tome los cambios.
 * 
 * @author rombus
 */
public class Main {
    private String occurrencesPath = "http://localhost:8001/api/occurrences/";
    private String piecesPath = "http://localhost:8001/api/pieces/";
    private Resty resty = new Resty();
    private Jedis redis;

    class Piece{
        public int id;
        public Duration duration;
        public Piece(int id, Duration duration){
            this.id = id;
            this.duration = duration;
        }
    }

    public static void main(String[] args) {
        Main m = new Main();
        
        if(args.length == 0){
            m.init("2");
        }
        else {
            m.init(args[0]);
        }
    }

    /**
     *
     * @param startingDelay la reproducción del primer clip empieza desde now + startingDelay minutes
     */
    private void init(String startingDelay){
        deleteAllOccurrences();
        insertOccurrences(startingDelay);

        // Send calchange
        redis = new Jedis("localhost", 6379, 1000);
        redis.publish("PCCP", "CALCHANGE");
    }

    

    private void insertOccurrences(String startingDelay){
        ArrayList<Piece> pieces = getAllPieces();
        boolean first = true;
        Duration prevDur = null;
        LocalDateTime prevStart = null;
        for(Piece piece:pieces){
            try {
                LocalDateTime start;
                
                if(first){
                    // El primero va startingDelay minutos a partir de ahora
                    first = false;
                    start = LocalDateTime.now().plus(Integer.parseInt(startingDelay), ChronoUnit.MINUTES);
                }
                else {
                    // Pongo uno a continuación del otro
                    start = prevStart.plus(prevDur);
                }
                
                HashMap jobj = new HashMap();
                jobj.put("pieceId", piece.id);
                jobj.put("startDateTime", ZonedDateTime.of(start, ZoneId.of("Z")));
                JSONObject obj = new JSONObject(jobj);
                resty.json(occurrencesPath, Resty.content(obj));    // Manda el insert a la bd

                prevStart = start;
                prevDur = piece.duration;
            } catch (IOException ex) {
                Logger.getLogger(Main.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

    }


    private ArrayList<Piece> getAllPieces(){
        ArrayList<Piece> pieces = new ArrayList<>();

        try {
            JSONArray jsonPieces = resty.json(piecesPath).array();
            for(int i=0; i<jsonPieces.length(); i++){
                JSONObject curPiece = jsonPieces.getJSONObject(i);
                curPiece = curPiece.getJSONObject("media");
                pieces.add(new Piece(curPiece.getInt("id"), Duration.parse(curPiece.getString("duration")) ));
            }
            
        } catch (IOException ex) { Logger.getLogger(Main.class.getName()).log(Level.SEVERE, null, ex);} catch (JSONException ex) {
            Logger.getLogger(Main.class.getName()).log(Level.SEVERE, null, ex);
        }
        return pieces;
    }



    private void deleteAllOccurrences(){
        // Borro todas las occurrences
        ArrayList<Integer> occurrencesIds = getAllOccurrencesIds();
        for(Integer id:occurrencesIds){
            try {
                resty.json(occurrencesPath+id, Resty.delete());
            } catch (IOException ex) { Logger.getLogger(Main.class.getName()).log(Level.SEVERE, null, ex); }
        }
    }
    private ArrayList<Integer> getAllOccurrencesIds() {
        ArrayList<Integer> occurrencesIds = new ArrayList<>();

        try {
            JSONArray jsonOccurrences = resty.json(occurrencesPath).array();
            int len = jsonOccurrences.length();

            // Iterate over every occurrence creating Occurrence objects
            for(int i=0; i<len; i++){
                JSONObject curOccurrence = jsonOccurrences.getJSONObject(i);
                int id = curOccurrence.getInt("id");

                occurrencesIds.add(id);
            }
        } catch (IOException ex) {
            // TODO: handle
            // MALFORMED URL (por ej)
            ex.printStackTrace();
        } catch (JSONException ex) {
            // Si la response del server no es json entra acá
            // TODO: handle
            ex.printStackTrace();
        }

        return occurrencesIds;
    }
}
