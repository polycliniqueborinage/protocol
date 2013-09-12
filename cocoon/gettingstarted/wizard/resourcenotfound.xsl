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
<xsl:stylesheet 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
  xmlns:error="http://apache.org/cocoon/error/2.1"
>

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
                <h2>Oops!</h2>
                <p>
                  Hippo Cocoon could not find your templates in the specified location.
                </p>
              </div>
              <div id="wizardcontent">
                <h2>
                  <xsl:value-of select="error:notify/error:message"/>
                </h2>
                <p>
                  Make sure the file is in the correct location, and try again.
                </p>                
              </div>
              <div id="wizardcontrols">
                <a href="step4"><span class="button">Back</span></a>
              </div>
            </div>
          </div>
        </div>
      </body>
    </html>
  </xsl:template>
  
</xsl:stylesheet>