LINE=$1

FILE=$( echo ${LINE} | cut -f 9 -d ",")
CNT=$( echo ${LINE} | cut -f 5 -d ",")
DOCNUM=$( echo ${LINE} | cut -f 6 -d ",")
KIND=$( echo ${LINE} | cut -f 7 -d ",")

PUBNUM="${CNT}-${DOCNUM}-${KIND}"

cp  ${FILE} "src/${PUBNUM}.tif"

#echo ${FILE}
echo ${PUBNUM}
