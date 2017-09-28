
ALTER TABLE mp_playout.Piece ADD COLUMN sketchId int; -- temporal
ALTER TABLE mp_playout.Occurrence ADD COLUMN filterId int; -- temporal hasta que definamos que hacer con los filterId + sketchId
