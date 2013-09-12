<?xml version="1.0" encoding="UTF-8"?>
<!--
  Copyright 2001-2008 Hippo (www.onehippo.com)
  
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
  xmlns:paging="http://hippo.nl/webdav2paging/1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  >
  
  <xsl:param name="substringafter"/>
  
  <xsl:template match="/">   
    <html>
      <head>
        <title>New Hippo Cocoon Project</title>
        <link href="css/wizard.css" type="text/css" rel="stylesheet"/>
      </head>
      <body>
        <div class="wizard">
          <h2 class="wizardname">New Hippo Cocoon Project</h2> 	
          <div id="wizardborder">
            <div id="wizardwrapper">
              <div id="wizardtitle">
                <h2>Sitemenu Configuration</h2>
                <p>
                  Hippo Cocoon needs to know where your sitemenus are.
                </p>
              </div>
              <div id="wizardcontent">
                <h2>Select sitemenu(s)</h2>
                <p>
                  Please select the sitemenu(s) you would like to use in your site.
                  Optionally you can provide a prefix for each sitemenu.
                </p>
                <p>
                  <br/>
                  <xsl:choose>
                    <xsl:when test="count(paging:webdavpaging/child::node())">
                      <form action="step3" method="post" id="sitemenuform">
                        <xsl:apply-templates select="paging:webdavpaging/child::node()"/>
                      </form>
                    </xsl:when>
                    <xsl:otherwise>
                      <h2>No sitemenu(s) found</h2>
                    </xsl:otherwise>
                  </xsl:choose>
                  
                </p>
                
              </div>
              <div id="wizardcontrols">
                <a href="step1a"><span class="button">Back</span></a>
                <xsl:text> </xsl:text>
                <a href="javascript:document.forms.sitemenuform.submit()"><span class="button">Next</span></a>
              </div>
            </div>
          </div>
        </div>
      </body>
    </html>
  </xsl:template>
  
  <xsl:template match="item">
    <div>
      <input type="checkbox" name="checkbox{position()}" checked="checked"/>
      <input name="prefix{position()}" id="prefix{position()}" type="text" size="6"/>
      <input name="location{position()}" type="hidden" value="{substring-after(href,$substringafter)}"/>
      <xsl:text> </xsl:text>
      <label for="prefix{position()}"><xsl:value-of select="substring-after(href,$substringafter)"/></label>
    </div>
  </xsl:template>
  
</xsl:stylesheet>
