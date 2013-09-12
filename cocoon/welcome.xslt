<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns="http://www.w3.org/1999/xhtml">

  <xsl:param name="year"/>
  
  <xsl:template match="welcome">
    <html xml:lang="en" lang="en">
      <head>
        <title>Welcome to Apache Cocoon</title>
        <link href="/system/styles/main.css" type="text/css" rel="stylesheet"/>
        <link href="/system/favicon.ico" rel="SHORTCUT ICON" />
      </head>
      <body>
        <h1>Welcome to Apache Cocoon!</h1>
        <xsl:apply-templates/>
        <p class="copyright">
         Copyright ? <xsl:value-of select="$year"/> <a href="http://www.apache.org/">The Apache Software Foundation</a>. All rights reserved.
        </p>
        <p class="block">
          Built on @date@ by @built-by@
        </p>
        <p class="block">
          <a href="http://cocoon.apache.org/"><img src="/system/images/powered.gif" alt="Powered by Apache Cocoon"/></a>
        </p>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="message">
    <p class="block"><xsl:apply-templates/></p>
  </xsl:template>

  <xsl:template match="link">
    <a href="{@href}"><xsl:apply-templates/></a>
  </xsl:template>

</xsl:stylesheet>
