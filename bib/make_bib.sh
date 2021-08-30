#!/bin/bash

echo "Downloadign google scholar"
wget -O scholar.bib "https://scholar.googleusercontent.com/citations?view_op=export_citations&user=47fQG30AAAAJ&citsig=AMD79ooAAAAAYS2fro7YV8HK-e5P9RWy6hyYsGzyznTV&hl=en"
echo "Covnerting"
pandoc scholar.bib --citeproc --csl nature.csl -t plain --wrap=none -o biblio.txt && rm scholar.bib