Anime Lists
===========

Anime mapping lists used by the [AniDb.net [MOD] scrapers](http://forum.xbmc.org/showthread.php?tid=142835) for [XBMC](http://xbmc.org).

These lists map information between [AniDb.net](http://anidb.net), [theTVDB.com](http://www.thetvdb.com), and [themoviedb.org](http://www.themoviedb.org).

The Lists
---------

### animetitles.xml ###
Copy of the animetitles.xml available from AniDb.net.  This is used by the scraper to search for matching titles.

### anime-movieset-list.xml ###
This list contains groupings of anime titles that are suitable as movie sets (includes movies, TV specials, and one-shot OVAs).

### anime-list-master.xml ###
This list contains entries for every title on AniDb.net and serves as a template from which all the remaining lists are derived.

### anime-list.xml ###
The default list used by the scraper.  Contains all entries from the master list that are not empty or marked as "unknown".

### anime-list-full.xml ###
Alternative list for the scraper.  Contains all entries from the master list that are not empty (but includes "unknown" titles).

### anime-list-unknown.xml ###
Maintenance list containing all entries that are marked as "unknown".
Any of these titles may potentially become "known" if they are added to theTVDB.com or themoviedb.org.

### anime-list-todo.xml ###
All empty entries from the master list.  Literally a to-do list.

Format
------

### anime-list-master.xml ###

A typical entry in anime-list-master.xml:

    <anime anidbid="23" tvdbid="76885" defaulttvdbseason="1" tmdbid="" imdbid="">
      <name>Cowboy Bebop</name>
      <mapping-list>
        <mapping anidbseason="0" tvdbseason="0">;1-2;</mapping>
      </mapping-list>
      <supplemental-info>
        <studio>Sunrise</studio>
      </supplemental-info>
    </anime>

Each entry consists of an **anime** node with the following attributes:

*   **anidbid** - The AniDb.net id (pre-filled).

*   **tvdbid** - theTVDB.com id.  Multi-episode titles not found on the tvdbid are marked as "unknown".
    One-off titles that won't ever be added to theTVDB.com (movies, TV specials, one-shot OVAs) are marked by their AniDb.net type,
    unless they can be associated to a multi-episode series (in which case they use the corresponding theTVDB.com id or "unknown").

    Pornographic titles are marked by "hentai" regardless of episode count as they will never appear on theTVDB.com.

*   **defaulttvdbseason** - The corresponding theTVDB.com season.
    For one-off titles it will be `1` unless associated to a multi-episode series, in which case it will be `0`.
    Series that span multiple seasons on theTVDB.com may be marked as `a` if the absolute episode numbering is defined and matches AniDb.net.

*   **tmdbid**/**imdbid** - themoviedb.org/imdb.com id.  Only used for one-off titles, unless there's definitely a themoviedb.org entry.
    Only one will be filled, with preference going to the imdb.com id, but the imdb.com entry must correspond exactly with AniDb.net.
    May be marked as "unknown" for movies (other types are inconsistent on usage).

Within the anime node are any of the following nodes

*   **name** - Title taken from the "main" listing in the animetitles.xml (pre-filled).

*   **mapping-list** - Used to map individual episodes between AniDb.net and theTVDB.com (see below).
    Not necessary if episode numbers match up exactly within the season(s).

*   **before** - Used to position special episodes within the regular episodes.
    This information is usually supplied by theTVDB.com for the scraper,
    and is only included in the mapping list if there is a disparity
    (such as when AniDb.net special episodes correspond to theTVDB.com regular episodes).

    Format is: ` ;1-5;2-6;...; ` where the first number in each mapping is the AniDb.net special episode number
    and the second is the AniDb.net regular episode it should be listed before.
    Episodes to be forced to the end of the series are mapped to their intended higher episode numbers.

*   **supplemental-info** - Extra information that is not supplied by the AniDb.net (see below).
    To be used sparingly.

#### mapping-list ####
The mapping-list node consists of one or more **mapping** nodes with the following attributes:

*   **anidbseason** - The AniDb.net season (either `1` for regular episodes or `0` for specials).

*   **tvdbseason** - The corresponding theTVDB.com season.

    The format for the mapping is: ` ;1-5;2-6;...; ` where the first number in each mapping is the AniDb.net episode number
    and the second is the corresponding theTVDB.com episode number for the season specified.

    Episodes on AniDb.net that don't match anything on theTVDB.com are mapped to 0 (or 99) if there's a conflict.

#### supplemental-info
The supplemental-info node may contain an optional attribute of **replace="true"**, in which case the information will replace that supplied by AniDb.net, otherwise it is just added to (and prioritised over) the AniDb.net information.

Any of the following nodes are allowed multiple times in a supplemental-info node:

*   **studio** - The animation studio.  This need only be included if no "Animation Work" or "Work" is supplied in the Main Staff box on AniDb.net.

*   **genre**

*   **actor**

*   **director**

*   **credits** - (i.e. Writer).

*   **thumb** - URL of a thumbnail to use instead of the AniDb.net one.  Needs to include an attribute of either **aspect="poster"** or **aspect="banner"**.

*   **fanart** - Fanart to use instead of theTVDB.com or themoviedb.org ones.  Can only be one fanart node, but it can contain multiple **thumb** nodes (see below).

The fanart node consists of **thumb** nodes that contain the URL of the fanart to use.

Each fanart thumb node has the following attributes:

*   **dim** - Dimensions of the fanart. e.g. ` 1280x720 `.

*   **colors** - e.g. ` |148,149,153|13,23,22|165,159,137| ` (...Usually left blank.)

*   **preview** - URL to a smaller preview copy of the thumb.

### anime-movieset-list.xml ###
A typical entry in anime-movieset-list.xml:

    <set>
      <anime anidbid="61">Koukaku Kidoutai</anime>
      <anime anidbid="890">Innocence</anime>
      <anime anidbid="6122">Koukaku Kidoutai 2.0</anime>
      <titles>
        <title type="main" xml:lang="x-jat">Koukaku Kidoutai Collection</title>
        <title type="official" xml:lang="en">Ghost in the Shell Collection</title>
      </titles>
    </set>

Each entry consists of a **set** node containing two or more **anime** nodes, and a single **titles** node that in turn contains one or more **title** nodes.

Each **anime** node consists of an **anidbid** attribute that corresponds to the AniDb.net id, and contains the "main" title (as taken from the animetitles.xml).

Each **title** node consists of two attributes, either **type="main" xml:lang="x-jat"** or **type="official" xml:lang="xx"** where **xx** is one of `en`, `de`, `fr`, `it`, `cs`, `sk`, `hu`, `pl`, `ru`, `ja`, `zh` (these are the only languages settable in the scraper).

The "main" title is always present and is derived from an appropriate "main" (romaji) title on AniDb.net, while the "official" titles are derived from the corresponding "official" titles in the relevant languages.  Unofficial translations are not used.

Contributing
------------
There are a couple of ways to contribute updates:

The simplest way is to just post the details of the update, either in the [XBMC forum thread](http://forum.xbmc.org/showthread.php?tid=142835) or as an [Issue](https://github.com/ScudLee/anime-lists/issues) on GitHub, and they will be dealt with when noticed.

Or you can post a [Pull Request](https://github.com/ScudLee/anime-lists/pulls):

1.   Fork the [repo](https://github.com/ScudLee/anime-lists)
2.   Create a new branch (`git checkout -b new_branch`)
3.   Edit either the **anime-list-master.xml** or **anime-movieset-list.xml** (or both)
4.   Commit your changes (`git commit -am "Added some titles"`)
5.   Push to the branch (`git push origin new_branch`)
6.   Submit the Pull Request
7.   ???
8.   Profit

**Do not edit any other lists** as they are automatically generated and will get updated after the Pull Request has been pulled.

Likewise, the anime names and the sort order in anime-movieset-list.xml will be automatically fixed based on the **anidbid**s, so don't be overly concerned about getting them exactly right (but obviously do get the **title** nodes right).