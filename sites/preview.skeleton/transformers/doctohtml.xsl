<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:ex="http://apache.org/cocoon/exception/1.0"
  xmlns:i18n="http://apache.org/cocoon/i18n/2.1"
  exclude-result-prefixes="ex"
>

	<xsl:import href="util/template.xsl"/>

	<!-- generate HTML skeleton on root element -->
	<xsl:template match="/">
  
		<xsl:variable name="patient_firstname">
  			<xsl:value-of select="kmehrmessage/folder/patient/firstname"/>
  		</xsl:variable>
  
		<xsl:variable name="patient_familyname">
  			<xsl:value-of select="kmehrmessage/folder/patient/familyname"/>
  		</xsl:variable>
  
		<xsl:variable name="patient_sex">
  			<xsl:value-of select="kmehrmessage/folder/patient/sex"/>
  		</xsl:variable>

  		<xsl:variable name="patient_birthdate">
  			<xsl:value-of select="kmehrmessage/folder/patient/birthdate/date"/>
  		</xsl:variable>

  		<xsl:variable name="user_firstname">
  			<xsl:value-of select="kmehrmessage/folder/transaction/author/hcparty/firstname"/>
  		</xsl:variable>
 
  		<xsl:variable name="user_familyname">
  			<xsl:value-of select="kmehrmessage/folder/transaction/author/hcparty/familyname"/>
  		</xsl:variable>

  		<xsl:variable name="user_inami">
  			<xsl:value-of select="kmehrmessage/folder/transaction/author/hcparty/id"/>
  		</xsl:variable>
  
  		<xsl:variable name="user_speciality">
  			<xsl:value-of select="kmehrmessage/folder/transaction/author/hcparty/cd"/>
  		</xsl:variable>
  
  		<xsl:variable name="user_inami">
  			<xsl:value-of select="kmehrmessage/folder/transaction/author/hcparty/id"/>
  		</xsl:variable>
  		
  		<xsl:variable name="text">
  			<xsl:copy-of select="kmehrmessage/folder/transaction/text/node()"/>
  		</xsl:variable>

  		<xsl:variable name="protocol_date">
  			<xsl:copy-of select="kmehrmessage/folder/transaction/date/node()"/>
  		</xsl:variable>

  		<xsl:variable name="rapport_date">
  			<xsl:copy-of select="kmehrmessage/header/date/node()"/>
  		</xsl:variable>

  		<xsl:variable name="rapport_time">
  			<xsl:copy-of select="kmehrmessage/header/time/node()"/>
  		</xsl:variable>
  		
  		<xsl:variable name="patient_birthdate_format">
  			<xsl:call-template name="formatDate">
        		<xsl:with-param name="DateTime">
        			<xsl:value-of select="$patient_birthdate"/>
        		</xsl:with-param>
    		</xsl:call-template>
  		</xsl:variable>
		
  		<xsl:variable name="protocol_date_format">
  			<xsl:call-template name="formatDate">
        		<xsl:with-param name="DateTime">
        			<xsl:value-of select="$protocol_date"/>
        		</xsl:with-param>
    		</xsl:call-template>
  		</xsl:variable>

  		<xsl:variable name="user_speciality_format">
  			<xsl:call-template name="getSpeciality">
        		<xsl:with-param name="speciality">
        			<xsl:value-of select="$user_speciality"/>
        		</xsl:with-param>
    		</xsl:call-template>
  		</xsl:variable>


		<html>
		    
		    <head>
				<title><xsl:value-of select="concat('Protocole de ',$patient_firstname,' ',$patient_familyname,' (',$patient_birthdate_format,')')"/></title>
    		   	<link type="text/css" href="/css/style.css" rel="stylesheet" />
		    </head>
		    
		    <body>
		        	<div id="outer">
		          		<div id="header">
							<xsl:value-of select="concat('Protocole de ',$patient_firstname,' ',$patient_familyname,' (',$patient_birthdate_format,')')"/>
    					</div>
		          		<div id="main">
		          			
		          			<xsl:for-each select="kmehrmessage/header/recipient/hcparty[familyname!='']">
							    <h2>
	        						<xsl:value-of select="concat('Pour le Docteur ', familyname,' ',firstname)"/>
				          			-
				          			<xsl:call-template name="getSpeciality">
						        		<xsl:with-param name="speciality">
						        			<xsl:value-of select="cd"/>
						        		</xsl:with-param>
						    		</xsl:call-template>
	    						</h2>
			          			<xsl:value-of select="address/street"/>
	    						<br/>
	    						<xsl:value-of select="concat(address/zip,' ',address/city)"/>
	    						<br/>
	    						<br/>
	    					</xsl:for-each>
		          			
    						<br/>
    						<br/>
    						
		          			<h3>
        						<xsl:value-of select="concat('Colfontaine, le ', $protocol_date_format)"/>
    						</h3>
    						<br/>
    						<xsl:copy-of select="kmehrmessage/folder/transaction/text/node()"/>
    						<br/>
    						<br/>
    						<br/>
    						<h3>
        						<xsl:value-of select="concat('Docteur ', $user_familyname,' ',$user_firstname)"/>
    						</h3>
    						<h3>
        						<xsl:value-of select="$user_speciality_format"/>
    						</h3>
    						<h3>
        						Numéro INAMI : <xsl:value-of select="$user_inami"/>
    						</h3>
    						<br/>
    						<br/>
    						<br/>
		          			<h6>
        						<xsl:value-of select="concat('Rapport encodé le ', $rapport_date,' à ',$rapport_time)"/>
    						</h6>
		          			<h6>
        						à la Nouvelle Polyclinique du Borinage
    						</h6>
		          		</div>
		        	</div>
		  	
		  	</body>
		  
		  </html>
	
	</xsl:template>

</xsl:stylesheet>     
