<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">

	<xsl:import href="util/html2fo_rtf.xsl"/>
	<xsl:import href="util/template.xsl"/>

 	<xsl:attribute-set name="regular-text">
    <xsl:attribute name="font-size">12pt</xsl:attribute>
    <xsl:attribute name="font-family">sans-serif</xsl:attribute>
  	</xsl:attribute-set>

  	<xsl:attribute-set name="emphasized-text" use-attribute-sets="regular-text">
    <xsl:attribute name="font-style">italic</xsl:attribute>
  	</xsl:attribute-set>

  	<xsl:attribute-set name="large-text" use-attribute-sets="regular-text">
    <xsl:attribute name="font-size">18pt</xsl:attribute>
    <xsl:attribute name="font-weight">bold</xsl:attribute>
    <xsl:attribute name="space-after.optimum">21pt</xsl:attribute>
  	</xsl:attribute-set>

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
  		
  		<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">

		    <fo:layout-master-set>
		    	<fo:simple-page-master master-name="main" page-width="8.5in" page-height="11in" margin-left="1in" margin-right="1in" margin-top="0in" margin-bottom="0.5in">
		        	<fo:region-body margin-top="2.1in" margin-bottom="0.25in"/>
		       		<fo:region-before extent="0.25in"/>
		       		<fo:region-after extent="0.25in"/>
		    	</fo:simple-page-master>
			</fo:layout-master-set>

	   		<fo:page-sequence master-reference="main" initial-page-number="1">
			
				<fo:static-content flow-name="xsl-region-before">
					<fo:block-container absolute-position="absolute" font-size="10pt" font-family="serif" line-height="14pt" left="0pt" top="20pt" z-index="1">
						<fo:block>
						Téléphone: (065) 66 39 39
						</fo:block>
						<fo:block>
						Téléphone: (065) 67 10 14
						</fo:block>
						<fo:block>
						Téléphone: (065) 66 15 28
						</fo:block>
						<fo:block>
						Fax      : (065) 66 39 28
						</fo:block>
						<fo:block>
						Web      : 
							<fo:basic-link color="blue" external-destination='url("http://www.polycliniqueborinage.org")'>
			                	http://www.polycliniqueborinage.org
							</fo:basic-link>
						</fo:block>
						<fo:block>
						Mail     : 
							<fo:basic-link color="blue" external-destination='url("mailto:admin@polycliniqueborinage.org")'>
			                	admin@polycliniqueborinage.org
							</fo:basic-link>
						</fo:block>
						<fo:block>
						N°d'entreprise : 0474.370.382
						</fo:block>
					</fo:block-container>
					<!-- fo:block-container absolute-position="absolute" left="200pt" top="10pt" z-index="2">
						<fo:block>
							<fo:external-graphic src="resources/images/entete.jpg" height="50px" vertical-align="middle"/> 
						</fo:block>
					</fo:block-container-->
			    </fo:static-content>

				<fo:static-content flow-name="xsl-region-after">
			       	<fo:block text-align="right" border-top="1pt dashed silver" font-size="10pt" font-family="serif" line-height="14pt">
			       	Nouvelle Polyclinique du Borinage - Page <fo:page-number/>
			       	</fo:block>
			    </fo:static-content>

				<fo:flow flow-name="xsl-region-body">
				
					<xsl:for-each select="kmehrmessage/header/recipient/hcparty[familyname!='']">
				       	<fo:block-container font-size="12pt" top="0pt" height="60pt">
	        				<fo:block text-align="end" font-family="serif" line-height="12pt" >
	        					<fo:inline font-weight="bold"><xsl:value-of select="concat('Dr. ',familyname,' ',firstname)"/></fo:inline><fo:block/>
				       			<xsl:value-of select="address/street"/><fo:block/>
				       			<xsl:value-of select="concat(address/zip,' ',address/city)"/><fo:block/>
				       		</fo:block>
	        			</fo:block-container>
	        			<fo:block><fo:leader/>&#160;</fo:block>
        			</xsl:for-each>
					
	       			<fo:block font-size="13pt" font-family="sans-serif" line-height="14pt" text-align="left" padding-top="30pt" margin-left="110pt">
			        	Docteur <xsl:value-of select="concat($user_firstname,' ',$user_familyname)"/><fo:block/>
						<xsl:call-template name="getSpeciality">
        					<xsl:with-param name="speciality"><xsl:value-of select="$user_speciality"/></xsl:with-param>
    					</xsl:call-template>
       				</fo:block>
       				
	       			<fo:block font-size="13pt" font-family="sans-serif" line-height="20pt" space-before="10pt" space-after="10pt" text-align="right" padding-top="0pt">
			        	Colfontaine, le 
			        	<xsl:call-template name="formatDate">
        					<xsl:with-param name="DateTime">
        						<xsl:value-of select="$protocol_date"/>
        					</xsl:with-param>
    					</xsl:call-template>
       				</fo:block>

	       			<fo:block font-weight="bold" font-size="14pt" font-family="sans-serif" line-height="20pt" space-before="10pt" space-after="10pt" text-align="left" padding-top="0pt">
			        	Concerne :
			        	<xsl:call-template name="getSex">
        					<xsl:with-param name="sex"><xsl:value-of select="$patient_sex"/></xsl:with-param>
    					</xsl:call-template>
			        	<xsl:value-of select="concat($patient_firstname,' ',$patient_familyname,', né le ')"/>
			        	<xsl:call-template name="formatDate">
        					<xsl:with-param name="DateTime">
        						<xsl:value-of select="$patient_birthdate"/>
        					</xsl:with-param>
    					</xsl:call-template>
       				</fo:block>
       				
			       <fo:block font-size="13pt" font-family="sans-serif" line-height="15pt" space-after="3pt" text-align="justify">
			       		<xsl:apply-templates select="kmehrmessage/folder/transaction/text/node()"/>
			       </fo:block>

	       			<fo:block font-size="13pt" font-family="sans-serif" line-height="15pt" space-before="10pt" space-after="10pt" text-align="right" padding-top="0pt">
			        	Docteur <xsl:value-of select="$user_familyname"/><fo:block/>
			        	<xsl:call-template name="getSpeciality">
        					<xsl:with-param name="speciality"><xsl:value-of select="$user_speciality"/></xsl:with-param>
    					</xsl:call-template>
						<fo:block/>
						Dicté, non relu<fo:block/>
       				</fo:block>

	       			<fo:block font="italic 13pt sans-serif" line-height="20pt" space-before="10pt" space-after="10pt" text-align="left" padding-top="0pt">
			        	N.B. : Courrier également par Medibridge.
       				</fo:block>
		     	
		     		<fo:block id="theEnd" />
		     		
		     	</fo:flow>
   			
   			</fo:page-sequence>
 		
 		</fo:root>
		
	</xsl:template>


</xsl:stylesheet>

  
