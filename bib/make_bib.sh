#!/bin/bash

for file in "$@"
do
    if [[ -f "$file" ]]; then
        echo "Using local BibTeX file $file"
        cp "$file" scholar.bib
    else
        echo "Skipping non-existent file $file"
        continue
    fi
    echo "Converting"
    pandoc scholar.bib --citeproc --csl nature.csl -t plain --wrap=none -o temp_biblio.txt
    cat temp_biblio.txt >> biblio.txt
    rm scholar.bib temp_biblio.txt
done