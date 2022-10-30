#! /bin/bash
source "${HOME}/Code/scripts/bg-schedule/conf.sh"

# SET THEME
if [[ `gsettings get org.gnome.desktop.interface color-scheme` =~ 'dark' ]];
then
    DARK_MODE=true
    TXT_COLOR="#FFFFFF"
    CANVAS_COLOR="#000000"
    SELECTED_COLOR="#48b75b"
else
    DARK_MODE=false
    TXT_COLOR="#505152"
    CANVAS_COLOR="white"
    SELECTED_COLOR="#bb0300"
fi

TIME=$(date +%T)
TIME=${TIME:0:2}

# CREATE A BLANK IMAGE
convert \
    -size $CANVAS_SIZE \
    canvas:$CANVAS_COLOR \
    $OUTPUT_FILENAME

# PLACE THE RENDER    
convert $OUTPUT_FILENAME \
    \( $LOGO -thumbnail x1080 \) -gravity east -composite \
    $OUTPUT_FILENAME

# DRAW THE SCHEDULE
distance=450
convert $OUTPUT_FILENAME \
    -font $FONT \
    -gravity west \
    -pointsize $NORMAL_FS \
    -fill $TXT_COLOR \
    $(
        for i in 09 10 11 12 13 14 15 16 17 18 19 20 21
        do
            if [[ "$i" == "$TIME" ]];
            then
                echo " -fill $SELECTED_COLOR -annotate +40-$distance $i:00 -fill $TXT_COLOR "
            else
                echo " -annotate +50-$distance $i:00 "
            fi
            ((distance=distance-75))
        done
    ) \
    -annotate +200-450 "$T1" \
    -annotate +200-375 "$T2" \
    -annotate +200-300 "$T3" \
    -annotate +200-225 "$T4" \
    -annotate +200-150 "$T5" \
    -annotate +200-75  "$T6" \
    -annotate +200+0   "$T7" \
    -annotate +200+75  "$T8" \
    -annotate +200+150 "$T9" \
    -annotate +200+225 "$TA" \
    -annotate +200+300 "$TB" \
    -annotate +200+375 "$TC" \
    -annotate +200+450 "$TD" \
    -fill "rgb(217,217,217)" \
    -draw 'rectangle 155,1030 165,70' \
    converted.png

gsettings set org.gnome.desktop.background picture-options 'scaled'

if $DARK_MODE;
then
    gsettings set org.gnome.desktop.background picture-uri-dark "file://$bgdir"
else
    gsettings set org.gnome.desktop.background picture-uri "file://$bgdir"
fi