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
<xsl:stylesheet version="1.0" 
  xmlns:paging="http://hippo.nl/webdav2paging/1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:config="http://hippo.nl/cocoon/generation/config"
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

              <xsl:choose>
                <xsl:when test="config:created">
                  <div id="wizardtitle">
                    <h2>Sitemenus succesfully configured!</h2>
                    <p>
                      Hippo Cocoon was succesfully configured for your sitemenus.
                    </p>
                  </div>
                  <div id="wizardcontent">
                    <h2>Rebuild and restart your site</h2>
                    <p>
                      For the changes to take effect, it is necessary to stop the site,
                      rebuild it (with "maven clean cocoon:deploy"), and restart it. Once the site is running again,
                      you can continue to the <a href="step4">next step</a>.
                    </p>
                    
                  </div>
                </xsl:when>
                <xsl:otherwise>
                  <div id="wizardtitle">
                    <h2>Oops!</h2>
                    <p>
                      Hippo Cocoon was not able to create a configuration for your sitemenus.
                    </p>
                  </div>
                  <div id="wizardcontent">
                    <h2>What now?</h2>
                    <p>
                      Make sure your sitemenus are correct, then go <a href="step2">back</a> and try again.
                    </p>
                    
                  </div>
                </xsl:otherwise>
              </xsl:choose>
              


              <div id="wizardcontrols">
                <a href="step2"><span class="button">Back</span></a>
                <xsl:text> </xsl:text>
                <a href="step4"><span class="button">Next</span></a>
              </div>
            </div>
          </div>
        </div>
      </body>
    </html>
  </xsl:template>



  
</xsl:stylesheet>
