<?xml version="1.0" encoding="ISO-8859-1"?>
<!--
   Copyright 2001-2006 Hippo (www.hippo.nl)

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License. 
-->
<xsl:stylesheet version="1.0" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:ex="http://apache.org/cocoon/exception/1.0"
  xmlns:i18n="http://apache.org/cocoon/i18n/2.1"
  exclude-result-prefixes="ex"
>

  
  <xsl:template match="/">
    <html>
      <head>
        <xsl:apply-templates select="ex:exception-report" mode="title"/>
        <link type="text/css" href="/css/style.css" rel="stylesheet" />
      </head>
      <body>
        <div id="outer">
          <div id="header">
            <a href="/"><i18n:text>html.head.title</i18n:text></a>
          </div>
          <div id="main">
            <xsl:apply-templates select="ex:exception-report" mode="header"/>
            <xsl:apply-templates select="ex:exception-report" mode="message"/>
          </div>
        </div>
      </body>
    </html>
  </xsl:template>
  
  <xsl:template match="ex:exception-report[@class='org.apache.excalibur.source.SourceNotFoundException' or @class='org.apache.cocoon.ResourceNotFoundException']" mode="title">
    <title>
      <i18n:text>error.title.sourcenotfound</i18n:text>
    </title>
  </xsl:template>

  <xsl:template match="ex:exception-report" mode="title">
    <title>
      <i18n:text>error.title.other</i18n:text>
    </title>
  </xsl:template>

  <xsl:template match="ex:exception-report[@class='org.apache.excalibur.source.SourceNotFoundException' or @class='org.apache.cocoon.ResourceNotFoundException']" mode="header">
    <h1>
      <i18n:text>error.title.sourcenotfound</i18n:text>
    </h1>
  </xsl:template>

  <xsl:template match="ex:exception-report" mode="header">
    <h1>
      <i18n:text>error.title.other</i18n:text>
    </h1>
  </xsl:template>

  <xsl:template match="ex:exception-report[@class='org.apache.excalibur.source.SourceNotFoundException' or @class='org.apache.cocoon.ResourceNotFoundException']" mode="message">
    <p>
      <i18n:text>error.message.sourcenotfound</i18n:text>
    </p>
  </xsl:template>

  <xsl:template match="ex:exception-report" mode="message">
    <p>
      <i18n:text>error.message.other</i18n:text>
    </p>
  </xsl:template>

</xsl:stylesheet>


