<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <xsl:output method="xml" encoding="UTF-8" />

  <xsl:template name="newline">
    <xsl:text disable-output-escaping="yes">
</xsl:text>
  </xsl:template>
  <xsl:template name="indent">
    <xsl:text disable-output-escaping="yes">	</xsl:text>
  </xsl:template>

  <xsl:template match="node()|@*">
    <xsl:copy>
      <xsl:apply-templates select="@*" />
      <xsl:apply-templates />
    </xsl:copy>
  </xsl:template>

  <xsl:template match="comment()">
    <xsl:call-template name="newline" />
    <xsl:call-template name="newline" />
    <xsl:copy>
      <xsl:apply-templates select="@*" />
      <xsl:apply-templates />
    </xsl:copy>
  </xsl:template>

  <xsl:template match="anime">
    <xsl:copy>
      <xsl:apply-templates select="@*" />
      <xsl:for-each select="title">
        <xsl:sort select="@type" />
        <xsl:sort select="@xml:lang" />
        <xsl:call-template name="newline" />
        <xsl:call-template name="indent" />
        <xsl:call-template name="indent" />
        <title>
        <xsl:attribute name="type"><xsl:value-of select="@type" /></xsl:attribute>
        <xsl:attribute name="xml:lang"><xsl:value-of select="@xml:lang" /></xsl:attribute>
        <xsl:value-of select="." /></title>  
      </xsl:for-each>
      <xsl:call-template name="newline" />
      <xsl:call-template name="indent" />
    </xsl:copy>
  </xsl:template>

</xsl:stylesheet>