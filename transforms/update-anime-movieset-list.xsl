<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:math="http://exslt.org/math"
  extension-element-prefixes="math" version="1.0">

  <xsl:output encoding="utf-8" indent="yes" />

  <xsl:param name="doc2" select="'../animetitles.xml'" />

  <xsl:key name="animebyid" match="anime" use="@aid"/>

  <xsl:template match="anime-set-list">
    <anime-set-list>
      <xsl:for-each select="set">
        <xsl:sort select="math:min(anime/@anidbid)" data-type="number" />
        <xsl:copy>
          <xsl:for-each select="anime">
            <xsl:sort select="@anidbid" data-type="number" />	
            <xsl:variable name="anidbid" select="@anidbid" />
            <xsl:for-each select="document($doc2)">
            <xsl:variable name="new" select="key('animebyid', $anidbid)" />
            <anime>
              <xsl:attribute name="anidbid"><xsl:value-of select="$anidbid" /></xsl:attribute>
              <xsl:value-of select='translate($new/title[@type = "main"],"`", "&apos;")' />
            </anime>
            </xsl:for-each>
          </xsl:for-each>
          <xsl:copy-of select="titles" />
        </xsl:copy>
      </xsl:for-each>
    </anime-set-list>
  </xsl:template>

</xsl:stylesheet>