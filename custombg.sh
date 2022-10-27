#! /bin/bash
source ./conf.sh
if [[ `gsettings get org.gnome.desktop.interface color-scheme` =~ 'dark' ]];
then
    DARK_MODE=true
    TXT_COLOR="#FFFFFF"
    CANVAS_COLOR="black"
else
    DARK_MODE=false
    TXT_COLOR="#000000"
    CANVAS_COLOR="white"
fi

TIME=$(date +%T)
TIME=${TIME:0:2}

case $TIME in
    21)
        OPTION="#F2323F"
        ;;
    22)
        echo "son las 10"
        S9=false
        ;;
    *)
        echo "FAIL"
        ;;
esac

# CREATE A BLANK IMAGE
convert \
    -size $CANVAS_SIZE \
    canvas:$CANVAS_COLOR \
    $OUTPUT_FILENAME
    
convert $OUTPUT_FILENAME \
    \( $LOGO -thumbnail x1080 \) -gravity east -composite \
    $OUTPUT_FILENAME

distance=450

convert $OUTPUT_FILENAME \
    -font $FONT \
    -gravity west \
    -pointsize $NORMAL_FS \
    -fill $TXT_COLOR \
    $(
        for i in 09 10 11 12 13 14 15 16 17 18 19 20 21
        do
            echo " -annotate +50-$distance $i:00 "
            ((distance=distance-75))
        done
    ) \
    $(
        ((distance=450))
        for i in {1..3}
        do

            echo " -annotate +200-$distance "${T1[@]}" "
            ((distance=distance-75))
        done
    ) \
    -fill "rgb(217,217,217)" \
    -draw 'rectangle 155,1030 165,70' \
    converted.png

pic="${HOME}/Code/scripts/converted.png"


gsettings set org.gnome.desktop.background picture-options 'scaled'

if $DARK_MODE;
then
    gsettings set org.gnome.desktop.background picture-uri-dark "file://$pic"
else
    gsettings set org.gnome.desktop.background picture-uri "file://$pic"
fi