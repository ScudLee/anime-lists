@echo off

curl -A Scudlee/anime-lists -o animetitles.xml --compressed http://anidb.net/api/anime-titles.xml.gz

xsltproc -o animetitles.xml transforms/sort-animetitles.xsl animetitles.xml
xsltproc -o anime-list-master.xml transforms/update-anime-list-master.xsl animetitles.xml
call generate-lists.bat

call git add "animetitles.xml"
call git add "anime-list-master.xml"
call git add "anime-list.xml"
call git add "anime-list-full.xml"
call git add "anime-movieset-list.xml"
call git add "anime-list-todo.xml"
call git add "anime-list-unknown.xml"

call git commit -m "Update to latest animetitles.xml"
