if test $# -gt 0
then
    pdf="$1*.pdf"         # get first name segment
else
    pdf="*.pdf"           # default to crop all .pdf files
fi

# crop
for f in $pdf
do
    pdfcrop $f
done

# delete duplications and rename
for f in *crop.pdf        # loop over cropped files
do
    of="${f%-*}.pdf"      # old file name       
    rm $of                # first remove the original file
    mv $f $of             # rename
done