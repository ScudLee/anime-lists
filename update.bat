@echo off

curl -A Scudlee/anime-lists -o animetitles.xml --compressed http://anidb.net/api/anime-titles.xml.gz

xsltproc -o animetitles.xml transforms/sort-animetitles.xsl animetitles.xml
xsltproc -o anime-list-master.xml transforms/update-anime-list-master.xsl animetitles.xml
call generate-lists.bat
