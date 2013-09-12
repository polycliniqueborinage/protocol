<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:status="http://apache.org/cocoon/status/2.0">

  <xsl:template match="status:statusinfo">
    <html>
      <head>
        <title>Cocoon Status [<xsl:value-of select="@status:host"/>]</title>
        <link href="/system/styles/main.css" type="text/css" rel="stylesheet"/>
        <script src="/system/scripts/main.js" type="text/javascript"/>
      </head>

      <body>
        <h1><xsl:value-of select="@status:host"/> - <xsl:value-of select="@status:date"/></h1>
        <h2>Available actions:</h2>
        <ul>
            <li><span class="description"><a href="/status">status</a></span></li>
            <li><span class="description"><a href="/clearcache">clear pipeline cache</a></span></li>
            <li><span class="description"><a href="/clearcache-repository-doc">clear repository documents cache</a></span></li>
            <li><span class="description"><a href="/clearcache-repository-binary">clear repository binaries cache</a></span></li>
            <li><span class="description"><a href="/clear-eventawaretransientstore">clear eventaware transientstore</a></span></li>
        </ul>  
        <xsl:apply-templates/>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="status:group">
    <h2><xsl:value-of select="@status:name"/></h2>
    <ul><xsl:apply-templates select="status:value"/></ul>
    <xsl:apply-templates select="status:group"/>
  </xsl:template>

  <xsl:template match="status:value[@status:name='showkeys']">
    <li>
      <a name="{.}"/>
      <span class="description"><a href="/status?store={.}#{.}">Show keys</a></span>
    </li>
    <li>
      <span class="description"><a href="/status?extended-report={.}#{.}">Extended Report</a></span>
    </li>
    <li>
      <span class="description"><a href="/status?clear-stats={.}#{.}">Clear Statistics</a></span>
    </li>
    <li>
      <span class="description"><a href="/status?analyze-this={.}#{.}">CRC Memory Analyze Cache</a></span>
    </li>
    
  </xsl:template>
  
   <xsl:template match="status:value[@status:name='crc_analyzer']">
    <li>
      <span class="description"><xsl:value-of select="@status:name"/><xsl:text>: </xsl:text></span>
      <ul>
          <xsl:apply-templates select="status:line" mode="crc">
              <xsl:sort order="descending" data-type="number" select="@status:value"/>
          </xsl:apply-templates>
      </ul>
    </li>
  </xsl:template>
  
  <xsl:template match="status:value[@status:name='crc_analyzer']">
    <li>
      <span class="description"><xsl:value-of select="@status:name"/><xsl:text>: </xsl:text></span>
      <ul>
          <xsl:apply-templates select="status:line" mode="crc">
              <xsl:sort order="descending" data-type="number" select="@status:value"/>
          </xsl:apply-templates>
      </ul>
    </li>
  </xsl:template>
  
  <xsl:template match="status:value[@status:name='statistics']">
    <li>
      <span class="description"><xsl:value-of select="@status:name"/><xsl:text>: </xsl:text></span>
      <ul>
          <xsl:apply-templates select="status:line" mode="statistics"/>
      </ul>
    </li>
  </xsl:template>
  
  
  <xsl:template match="status:value">
    <li>
      <span class="description"><xsl:value-of select="@status:name"/><xsl:text>: </xsl:text></span>
      <xsl:choose>
        <xsl:when test="contains(@status:name,'free') or contains(@status:name,'total')">
          <xsl:call-template name="suffix">
            <xsl:with-param name="bytes" select="number(.)"/>
          </xsl:call-template>
        </xsl:when>      
        <xsl:when test="count(status:line) &lt;= 1">
          <xsl:value-of select="status:line"/>
        </xsl:when>
        <xsl:otherwise>
          <span class="switch" id="{generate-id(.)}-switch" onclick="toggle('{generate-id(.)}')">[show]</span>
          <ul id="{generate-id(.)}" style="display: none">
             <xsl:apply-templates />
          </ul>
        </xsl:otherwise>
      </xsl:choose>
    </li>
  </xsl:template>

  <xsl:template match="status:line" mode="crc">
    <li>
        <xsl:value-of select="@status:value"/>
        <span class="switch" id="{generate-id(.)}-switch" onclick="toggle('{generate-id(.)}')">[show]</span>
          <ul id="{generate-id(.)}" style="display: none">
             <xsl:apply-templates />
         </ul>
    </li>
  </xsl:template>
  
  <xsl:template match="status:line" mode="statistics">
    <li>
        <xsl:call-template name="linebreaks">
            <xsl:with-param name="sString" select="."/>
        </xsl:call-template>
    </li>
  </xsl:template>
  
  <xsl:template match="status:line">
    <li><xsl:value-of select="."/></li>
  </xsl:template>

  <xsl:template name="suffix">
    <xsl:param name="bytes"/>
    <xsl:choose>
      <!-- More than 4 MB (=4194304) -->
      <xsl:when test="$bytes &gt;= 4194304">
        <xsl:value-of select="round($bytes div 10485.76) div 100"/> MB
      </xsl:when>
      <!-- More than 4 KB (=4096) -->
      <xsl:when test="$bytes &gt; 4096">
        <xsl:value-of select="round($bytes div 10.24) div 100"/> KB
      </xsl:when>
      <!-- Less -->
      <xsl:otherwise>
        <xsl:value-of select="$bytes"/> B
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  
  <xsl:template name="linebreaks">
   <xsl:param name="sString"/>
      <xsl:choose>
          <xsl:when test="contains($sString, '&#10;')">
              <xsl:value-of select="substring-before($sString, '&#10;')"/><br/>
              <xsl:call-template name="linebreaks">
                  <xsl:with-param name="sString" select="substring-after($sString, '&#10;')" />
              </xsl:call-template>
          </xsl:when>
          <xsl:otherwise>
              <xsl:value-of select="$sString"/>
          </xsl:otherwise>
      </xsl:choose>
  </xsl:template>
</xsl:stylesheet>
