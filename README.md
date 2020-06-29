# READ ME

## Download

```bash
for file in $(cat ~/yellowbook.txt); do echo ${file} && curl -L -O https://bulkdata.uspto.gov/data/patent/grant/yellowbook/1790_2010/${file} ; done
```

## Untar

```bash
for file in $(find *.tar); do echo ${file} && tar -xf ${file}; done
```

## Parse

```bash
find -O3 -L ./ -name "*.xml" >> upi_dir.txt
cat upi_dir.txt | xargs -n 1 ./upi-parser.sh >> upi_parsed.csv
```

The goal is to identify the subset of files we actually need to OCR

|upi.xml|dirname|bib-page-1|abstr-page-1|country|docnum|kind|date|ocr-1|ocr-2
---|---|---|---|---|---|---|---|---|---|---
var num|1|2|3|4|5|6|7|8|9|10

```bash
awk -F "," '$3!=$4 {print $1}' upi_parsed.csv
```

check that bib-page-1 is always the same as abstr-page-1. Nb: seems to be the case

## OCR

```bash
tail --lines=+$(ls data | wc -l) upi_parsed.csv | parallel -j 2 ./upi-ocr.sh :::: -
```

Nb: we limit the nb of jobs to 2. OCR is very greedy and takes up to 4 cores per job. 
