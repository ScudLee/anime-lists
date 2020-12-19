#! /bin/sh

curl -A Scudlee/anime-lists --compressed https://anidb.net/api/anime-titles.xml.gz | gzip -dc > animetitles.xml

xsltproc -o animetitles.xml transforms/sort-animetitles.xsl animetitles.xml
xsltproc -o anime-list-master.xml transforms/update-anime-list-master.xsl animetitles.xml
./generate-lists.sh
