#!/bin/bash
# do pdfcrop in batch
# assume we have aa1.pdf, aa2.pdf, aa3.pdf, bb1.pdf, bb2.pdf, bb3.pdf
# we can use smartpdfcrop aa bb1.pdf to crop aa*.pdf and bb1.pdf

# 0. classification
if [ $# -gt 0 ]; then
    pdf=()                                 # init an empty container to store all .pdf files
    general=()                             # init an empty container to store general common-*.pdf files
    for fname in $@; do
	if [ ${fname##*.} == pdf ]; then   # if the extension is .pdf
	    pdf+=($fname)                  # append to pdf pool
	else
	    general+=("$fname*.pdf")       # append to general pool
	fi
    done
else
    pdf="*.pdf"                            # get all .pdf files
fi
	     
# 1. crop .pdf files
for i in $pdf
do
    pdfcrop $i
done
    
# 2. crop general pdf files
for i in $general
do
    pdfcrop $i
done

# 3. delete duplications and rename all of cropped files
for f in *crop.pdf        # loop over cropped files
do
    of="${f%-*}.pdf"      # old file name       
    rm $of                # first remove the original file
    mv $f $of             # rename
done
