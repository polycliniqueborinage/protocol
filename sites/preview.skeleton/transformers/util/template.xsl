<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">

	<xsl:template name="getSpeciality">
    	<xsl:param name="speciality"/>
    		<xsl:choose>
  				<xsl:when test="$speciality = 'deptanesthesiology'">Anesthésiste</xsl:when>
  				<xsl:when test="$speciality = 'deptbacteriology'">Bactériologue</xsl:when>
  				<xsl:when test="$speciality = 'deptcardiology'">Cardiologue</xsl:when>
  				<xsl:when test="$speciality = 'deptdermatology'">Dermatologue</xsl:when>
  				<xsl:when test="$speciality = 'deptdietetics'">Diététicien</xsl:when>
  				<xsl:when test="$speciality = 'deptgastroenterology'">Gastro-entérologue</xsl:when>
  				<xsl:when test="$speciality = 'deptgeneralpractice'">Médecin Généraliste</xsl:when>
  				<xsl:when test="$speciality = 'deptgenetics'">Généticiens</xsl:when>
  				<xsl:when test="$speciality = 'deptgeriatry'">Gériatrie</xsl:when>
  				<xsl:when test="$speciality = 'deptgynecology'">Gynécologue</xsl:when>
  				<xsl:when test="$speciality = 'deptkinesitherapy'">Kinésitherapeute</xsl:when>
  				<xsl:when test="$speciality = 'deptlaboratory'">Laboratoire</xsl:when>
  				<xsl:when test="$speciality = 'deptneurology'">Neurologue</xsl:when>
  				<xsl:when test="$speciality = 'deptnte'">O.R.L.</xsl:when>
  				<xsl:when test="$speciality = 'deptoncology'">Oncologye</xsl:when>
  				<xsl:when test="$speciality = 'deptpediatry'">Pédiatre</xsl:when>
  				<xsl:when test="$speciality = 'deptpharmacy'">Pharmacien</xsl:when>
  				<xsl:when test="$speciality = 'deptpneumology'">Pneumologue</xsl:when>
  				<xsl:when test="$speciality = 'deptpsychatry'">Psychiatre</xsl:when>
  				<xsl:when test="$speciality = 'deptradiology'">Radiologue</xsl:when>
  				<xsl:when test="$speciality = 'deptradiotherapy'">Radiothérapeute</xsl:when>
  				<xsl:when test="$speciality = 'deptrhumatology'">Rhumatologue</xsl:when>
  				<xsl:when test="$speciality = 'deptstomatology'">Stomatologue</xsl:when>
  				<xsl:when test="$speciality = 'deptsurgery'">Chirurgien</xsl:when>
  				<xsl:when test="$speciality = 'depttoxicology'">Toxicologue</xsl:when>
  				<xsl:when test="$speciality = 'depturology'">Urologue</xsl:when>
  				<xsl:when test="$speciality = 'orghospital'">Hospital</xsl:when>
  				<xsl:when test="$speciality = 'persbiologist'">Biologiste</xsl:when>
  				<xsl:when test="$speciality = 'persdentist'">Dentiste</xsl:when>
  				<xsl:when test="$speciality = 'persnurse'">Infirmier</xsl:when>
			</xsl:choose>
    	<fo:block/>
	</xsl:template>


	<xsl:template name="getSex">
    	<xsl:param name="sex"/>
    		<xsl:choose>
  				<xsl:when test="$sex = 'male'">Monsieur </xsl:when>
  				<xsl:when test="$sex = 'female'">Madame </xsl:when>
			</xsl:choose>
	</xsl:template>
	
	
	<xsl:template name="formatDate">
		<xsl:param name="DateTime" />
		<!-- date format 1998-03-15 -->
		<xsl:variable name="year">
			<xsl:value-of select="substring-before($DateTime,'-')" />
		</xsl:variable>
		<xsl:variable name="mo-temp">
			<xsl:value-of select="substring-after($DateTime,'-')" />
		</xsl:variable>
		<xsl:variable name="month">
			<xsl:value-of select="substring-before($mo-temp,'-')" />
		</xsl:variable>
		<xsl:variable name="day">
			<xsl:value-of select="substring-after($mo-temp,'-')" />
		</xsl:variable>
		<xsl:if test="$day != '00'">
			<xsl:value-of select="$day"/>
			<xsl:value-of select="' '"/>
		</xsl:if>
		<xsl:choose>
			<xsl:when test="$month = '1' or $month = '01'">Janvier </xsl:when>
			<xsl:when test="$month = '2' or $month = '02'">Février </xsl:when>
			<xsl:when test="$month = '3' or $month = '03'">Mars </xsl:when>
			<xsl:when test="$month = '4' or $month = '04'">Avril </xsl:when>
			<xsl:when test="$month = '5' or $month = '05'">Mai </xsl:when>
			<xsl:when test="$month = '6' or $month = '06'">Juin </xsl:when>
			<xsl:when test="$month = '7' or $month = '07'">Juillet </xsl:when>
			<xsl:when test="$month = '8' or $month = '08'">Août </xsl:when>
			<xsl:when test="$month = '9' or $month = '09'">Septembre </xsl:when>
			<xsl:when test="$month = '10'">Octobre </xsl:when>
			<xsl:when test="$month = '11'">Novembre </xsl:when>
			<xsl:when test="$month = '12'">Décembre </xsl:when>
			<xsl:when test="$month = '0' or $month = '00'"></xsl:when><!-- do nothing -->
		</xsl:choose>
		<xsl:value-of select="$year"/>
	</xsl:template>

</xsl:stylesheet>

  
