#! /bin/sh

curl -A Scudlee/anime-lists -o animetitles.xml --compressed http://anidb.net/api/anime-titles.xml.gz

xsltproc -o animetitles.xml transforms/sort-animetitles.xsl animetitles.xml
xsltproc -o anime-list-master.xml transforms/update-anime-list-master.xsl animetitles.xml
./generate-lists.sh

git add "animetitles.xml"
git add "anime-list-master.xml"
git add "anime-list.xml"
git add "anime-list-full.xml"
git add "anime-movieset-list.xml"
git add "anime-list-todo.xml"
git add "anime-list-unknown.xml"

git commit -m "Update to latest animetitles.xml"
