PUBNUM=$1

SRC_FILE="src/${PUBNUM}.tif"
OUT_FILE="data/${PUBNUM}"

tesseract -l eng  ${SRC_FILE}  ${OUT_FILE}

echo ${PUBNUM}
