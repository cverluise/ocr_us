LINE=$1

FILE=$( echo ${LINE} | cut -f 9 -d ",")
CNT=$( echo ${LINE} | cut -f 5 -d ",")
DOCNUM=$( echo ${LINE} | cut -f 6 -d ",")
KIND=$( echo ${LINE} | cut -f 7 -d ",")

PUBNUM="${CNT}-${DOCNUM}-${KIND}"

tesseract -l eng ${FILE} "data/${PUBNUM}"

echo ${FILE}
echo ${PUBNUM}
