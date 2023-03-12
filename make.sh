#!/usr/bin/env bash

TEMPDIR=$(pwd)/tmp
mkdir -p ${TEMPDIR}

PDFLATEX=pdflatex
PDFLATEX_FLAGS="-output-directory=${TEMPDIR}"

[ "$DEBUG" == 'true' ] && set -x

for TEXFILE in *.tex; do
    BASENAME="$(basename ${TEXFILE} .tex)"

    ${PDFLATEX} ${PDFLATEX_FLAGS} ${TEXFILE}

    mv "${TEMPDIR}/${BASENAME}.pdf" .
done

rm -f __latex*
rm -f *.gz
rm -f *.aux
rm -f *.log *.fls *.fdb*
