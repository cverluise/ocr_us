BIBP1="(//bib-pages/begin/text())[1]"
ABSP1="(//abstract-pages/begin/text())[1]"
CNT="(//document-id/country/text())[1]"
DOCNUM="(//document-id/doc-number/text())[1]"
KIND="(//document-id/kind/text())[1]"
DATE="(//document-id/date/text())[1]"

BIBP1_A=$(xmllint $1 --xpath ${BIBP1})
ABSP1_A=$(xmllint $1 --xpath ${ABSP1})
CNT_A=$(xmllint $1 --xpath ${CNT})
DOCNUM_A=$(xmllint $1 --xpath ${DOCNUM})
KIND_A=$(xmllint $1 --xpath ${KIND})
DATE_A=$(xmllint $1 --xpath ${DATE})
DIRNAME=$(dirname $1)
OCR_FILE1=$(find ${DIRNAME} -name "*00${BIBP1_A}.tif")
OCR_FILE2=$(find ${DIRNAME} -name "*00${ABSP1_A}.tif")

echo $1,${DIRNAME},${BIBP1_A},${ABSP1_A},${CNT_A},${DOCNUM_A},${KIND_A},${DATE_A},${OCR_FILE1},${OCR_FILE2}
