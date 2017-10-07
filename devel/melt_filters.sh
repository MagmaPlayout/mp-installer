#!/bin/bash
# This script allows you to test a few MELT filters

# Configure paths:
LOGO=/home/rombus/Documentos/PROYECTO_FINAL/VIDS/stamp.png 		# For watermark filter
CLIP=/home/rombus/Documentos/PROYECTO_FINAL/VIDS/dipper.mp4		# For all filters
MLT_OUTPUT=/home/rombus/Documentos/PROYECTO_FINAL/VIDS/			# For xml consumer


# Usage: callMelt WATERMARK GRAYSCALE TIME OLDFILM DUST XML_OUTPUT
# each argument must be 1 to enable and 0 to disable
function callMelt {
	[ $1 -eq 1 ] && WATERMARK=true 	|| WATERMARK=false;
	[ $2 -eq 1 ] && GRAYSCALE=true 	|| GRAYSCALE=false;
	[ $3 -eq 1 ] && TIME=true 		|| TIME=false;
	[ $4 -eq 1 ] && OLDFILM=true	|| OLDFILM=false;
	[ $5 -eq 1 ] && DUST=true 		|| DUST=false;
	w=""; g=""; c=""; c2=""; o=""; d="";

	if $WATERMARK; then
		w=" -filter watermark:$LOGO \
				composite.geometry=5%,75%,20%,20% ";
	fi

	if $GRAYSCALE; then
		g=" -filter grayscale  ";
	fi

	if $TIME; then
		c=" -filter dynamictext:";
		c2=" halign=right valign=bottom \
				size=22 \
				bgcolour=#00FFFFFF fgcolour=#FFFFFF \
				family=freemono ";
	fi

	if $OLDFIM; then
		o=" -filter oldfilm ";
	fi

	if $DUST; then
		d=" -filter dust ";
	fi

	if [ $6 -eq 1 ]; then
		melt $CLIP $g $d $o $c"#localtime %H:%M#"$c2 $w -consumer xml > $MLT_OUTPUT$1$2$3$4$5.mlt
		echo "Finished writing an mlt file"
	else
		melt $CLIP $g $d $o $c"#localtime %H:%M#"$c2 $w
	fi
}


# Turn on/off each filter
WATERMARK=1
GRAYSCALE=1
TIME=1
OLDFILM=1
DUST=1
TO_XML=0

callMelt $WATERMARK $GRAYSCALE $TIME $OLDFILM $DUST $TO_XML;
