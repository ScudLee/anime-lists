These xsl files are used to update the various lists.

### sort-animetitles.xsl ###
This file is used to sort the title nodes and attributes within animetitles.xml.  
This is primarily for cosmetic reasons as the title nodes would often shift position during updates, causing unneccessarily large diffs.  
Also some of the attributes of the title nodes have started swapping around, which may negatively impact the Kodi scraper.

### update-anime-list-master.xsl ###
This updates anime-list-master.xml, using anime-list-master.xml and animetitles.xml, to add new shows, remove deleted shows, and update the titles of shows.

### update-anime-movieset-list.xsl ###
This updates the anime-movieset-list.xml, using anime-movieset-list.xml and animetitles.xml, to update the titles of movies, and also sort the list. 
(Requires exslt for math functions.)

### create-anime-list.xsl ###
This creates anime-list.xml, using anime-list-master.xml, by removing any titles with blank/unknown tvdbids/imdbids, and also omitting any blank attributes.

### create-anime-list-full.xsl ###
This creates anime-list-full.xml, using anime-list-master.xml, by removing any titles with blank tvdbids, and also omitting any blank attributes.

### create-anime-list-todo.xsl ###
This creates anime-list-todo.xml, using anime-list-master.xml, by including only titles with blank tvdbids and blank tmdbids/imdbids.  
Also adds a template as a comment.

### create-anime-list-unknown.xsl ###
This creates anime-list-unknown.xml, using anime-list-master.xml, by including only titles with unknown tvdbids or unknown tmdbids/imdbids.