#! /bin/sh
xsltproc -o anime-list.xml transforms/create-anime-list.xsl anime-list-master.xml
xsltproc -o anime-list-full.xml transforms/create-anime-list-full.xsl anime-list-master.xml
xsltproc -o anime-list-unknown.xml transforms/create-anime-list-unknown.xsl anime-list-master.xml
xsltproc -o anime-list-todo.xml transforms/create-anime-list-todo.xsl anime-list-master.xml
xsltproc -o anime-movieset-list.xml transforms/update-anime-movieset-list.xsl anime-movieset-list.xml
