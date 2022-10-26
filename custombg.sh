#! /bin/bash

#convert test.png -gravity North -pointsize 60 -annotate +0+100 'test' converted.png


# Draw a blue box
#convert test.png -strokewidth 0 -fill "rgba(49,49,238,0.8)" -draw "rectangle 600,50 50,150" converted.png 

# Draw some text
#convert -font /usr/share/fonts/urw-base35/NimbusMonoPS-BoldItalic.otf -fill white -pointsize 60 -draw 'text 100,100 "Schedule 1.0"' test.png converted.png

FONT="/usr/share/fonts/adobe-source-code-pro/SourceCodePro-Regular.otf"
SIZE="600x50"
BACKGROUND="black"

convert test.png \
    \( \
        -size $SIZE \
        -background $BACKGROUND \
        -fill white \
        -font $FONT \
        label:"Example" \
        -trim \
        -gravity center \
        -extent 600x100 \
    \) -gravity northwest -geometry +312+66 -composite converted.png
