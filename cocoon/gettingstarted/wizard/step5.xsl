<?xml version="1.0" encoding="UTF-8"?>
<!--
  Copyright 2001-2007 Hippo (www.hippo.nl)
  
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
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

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
                <h2>Congratulations!</h2>
                <p>
                  Hippo Cocoon succesfully generated a skeleton site for you.
                </p>
              </div>
              <div id="wizardcontent">
                <h2>Done!</h2>
                <p>
                  The skeleton site is now up and running!
                </p>
                <p>&#160;</p>
                <p>
                  <b>Homepage<xsl:if test="count(/create/homepages/homepage) &gt; 1">s</xsl:if>:</b>
                  <ul>
                    <xsl:apply-templates select="/create/homepages/homepage"/>
                  </ul>
                </p>
              </div>
              <div id="wizardcontrols">
                <a href="step4"><span class="button">Back</span></a>
                <!--<a href="#"><img src="gfx/wizardnext.gif" /></a>-->
              </div>
            </div>
          </div>
        </div>
      </body>
    </html>
  </xsl:template>
  
  <xsl:template match="homepage">
    <li>
      <a href="{@href}">
        <xsl:value-of select="@href"/>
      </a>
    </li>
  </xsl:template>
  
</xsl:stylesheet>