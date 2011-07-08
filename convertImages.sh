#!/bin/sh

GEN_DIR="generated_images"

mkdir site
mkdir files/${GEN_DIR}
mkdir files/${GEN_DIR}/img_250
mkdir files/${GEN_DIR}/img_150
mkdir files/${GEN_DIR}/img_130


#LOGO_IMG=grand_jete_with_sun_background_and_gradient
#LOGO_IMG_WIDTH=200
LOGO_IMG=grand_jete_with_sun_and_text
LOGO_IMG_WIDTH=350

inkscape -d 150 -b white -w ${LOGO_IMG_WIDTH} -e files/${GEN_DIR}/${LOGO_IMG}.png files/${LOGO_IMG}.svg 

inkscape -b white -w 20 -e site/favicon.ico files/${LOGO_IMG}.svg 
#convert favicon.png favicon.ico

# TODO: figure out how to stop producing all those slices
convert -crop ${LOGO_IMG_WIDTH}x1! files/${GEN_DIR}/${LOGO_IMG}.png files/${GEN_DIR}/gradient.png

for i in files/img/*.[jp][pn]g;
do 
    j=`echo $i | sed 's/files\/img\///'`; 
    echo $j; 
    convert ${i} -geometry 250 files/${GEN_DIR}/img_250/${j}
    convert ${i} -geometry 150 files/${GEN_DIR}/img_150/${j}
    convert ${i} -geometry 130 files/${GEN_DIR}/img_130/${j}
done


