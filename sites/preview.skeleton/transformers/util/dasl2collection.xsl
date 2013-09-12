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
	xmlns:site="http://hippo.nl/site/1.0"
	xmlns:collection="http://apache.org/cocoon/collection/1.0"
	xmlns:webdav="http://hippo.nl/webdav/1.0"
	xmlns:include="http://apache.org/cocoon/include/1.0" 
	xmlns:d="DAV:"
	xmlns:h="http://hippo.nl/cms/1.0" 
	exclude-result-prefixes="site collection webdav include d">
   
	<xsl:param name="path"/>
   
	<xsl:template match="/">
	  <collection:collection id="root">
	    <xsl:apply-templates select="//d:response"/>
	  </collection:collection>
	</xsl:template>
	
	<xsl:template match="d:response">
		<collection:resource name="{d:propstat/d:prop/d:displayname}">
			<xsl:variable name="current">
				<xsl:value-of select="d:href"/>
			</xsl:variable>
			<xsl:variable name="start">
				<xsl:value-of select="concat(d:href,'/')"/>
			</xsl:variable>
		  <collection:xpath docid="{d:propstat/d:prop/d:displayname}" uri="{substring-after(d:href,'/content')}">
		    <xsl:copy-of select="webdav:content/*"/>
		  </collection:xpath>
			<collection:properties>
				<xsl:copy-of select="d:propstat/d:prop/child::node()"/>
			</collection:properties>
			<xsl:for-each select="//d:response[contains(d:href,$start) and not(contains(substring-after(d:href,$start),'/'))]">
				<xsl:apply-templates select="."/>
			</xsl:for-each>
		</collection:resource>
	</xsl:template>
  
</xsl:stylesheet>
