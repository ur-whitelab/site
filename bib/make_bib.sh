#!/bin/bash

echo "Downloadign google scholar"
wget -O scholar.bib "https://scholar.googleusercontent.com/citations?view_op=export_citations&user=47fQG30AAAAJ&citsig=AMD79ooAAAAAYUpGgd1XpWJJWkWNlR3cW-fsE_k32WUF&hl=en"
echo "Covnerting"
pandoc scholar.bib --citeproc --csl nature.csl -t plain --wrap=none -o biblio.txt && rm scholar.bib