<?xml version="1.0" encoding = "ISO-8859-15" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

  <xsl:variable name="varModelName">Model Name: </xsl:variable>
  <xsl:variable name="varSubset">Subset: </xsl:variable>
  <xsl:variable name="varEndOfReport">*** End of report ***</xsl:variable>
  <xsl:variable name="varLevelColon">Level:</xsl:variable>
  <xsl:variable name="varReportingColon">Reporting:</xsl:variable>
  <xsl:variable name="varERROR">ERROR : </xsl:variable>
  <xsl:variable name="varWARNING">WARNING : </xsl:variable>
  <xsl:variable name="varSEVEREWARNING">SEVERE WARNING : </xsl:variable>
  <xsl:variable name="varNumberofWARNINGSColon">number of WARNINGS:</xsl:variable>
  <xsl:variable name="varNumberofERRORSColon">number of ERRORS:</xsl:variable>
  <xsl:variable name="varModelSubset">Model/Subset</xsl:variable>
  <xsl:variable name="varActionBlock">Action Block</xsl:variable>
  <xsl:variable name="varScreen">Screen for Procedure Step</xsl:variable>
  <xsl:variable name="varSubjectArea">Subject Area</xsl:variable>
  <xsl:variable name="varRelationship">Relationship</xsl:variable>
  <xsl:variable name="varFunction">Function</xsl:variable>
  <xsl:variable name="varProcess">Process</xsl:variable>
  <xsl:variable name="varBusinessSystem">Business System</xsl:variable>
  <xsl:variable name="varProcedure">Procedure</xsl:variable>
  <xsl:variable name="varProcedureStep">Procedure Step</xsl:variable>
  <xsl:variable name="varTable">Table</xsl:variable>
  <xsl:variable name="varForeignKeyColumn">Foreign Key Column</xsl:variable>
  <xsl:variable name="varwithinTable">within Table</xsl:variable>
  <xsl:variable name="varDatabase">Database</xsl:variable>
  <xsl:variable name="varIndex">Index</xsl:variable>
  <xsl:variable name="varTechnicalDesign">Technical Design</xsl:variable>
  <xsl:variable name="varcomma">,</xsl:variable>
  <xsl:variable name="varAttribute">Attribute </xsl:variable>
  <xsl:variable name="varAttrOfET"> of Entity Type </xsl:variable>

  <xsl:template match="/">
      
   <DIV STYLE="background-color:white; left:10; position:relative; font-size: 10pt">
	<h1 style="left:100; position:relative">
		<xsl:value-of select="Report/title"/></h1>
	<h3><xsl:copy-of select="$varModelName" /><span style="left:20; position:relative"><xsl:value-of select="Report/modelname"/></span></h3>
	<h3><xsl:copy-of select="$varSubset" /><span style="left:20; position:relative"><xsl:value-of select="Report/subset"/></span></h3>
	<h3><xsl:value-of select="Report/datetime"/></h3>
	<h3></h3>
	<h3></h3>
     <xsl:apply-templates select="Report"/>
     <br />
   	<ul style="left:5; position:relative"><b style="left:100; position:relative"><xsl:copy-of select="$varEndOfReport" /></b></ul>
   </DIV>

  </xsl:template>
  
  <xsl:template match="Report">
	<xsl:apply-templates select="ReportDescription" />
  </xsl:template>

  <xsl:template match="ReportDescription">
	<ul style="left:5; position:relative"><b><xsl:copy-of select="$varLevelColon" /></b>
	        <span style="left:100; position:absolute"><xsl:value-of select="@Level" /></span>
	</ul>
	<ul style="left:5; position:relative"><b><xsl:copy-of select="$varReportingColon" /></b>
	        <span style="left:100; position:absolute"><xsl:value-of select="@Description" /></span>
	</ul>
	<xsl:for-each select="TPCROOT">
		<ul style="left:10; position:relative"><b><xsl:value-of select="@Label" /></b>
			<span style="left:5; position:relative"><b><xsl:copy-of select="$varModelSubset" /></b></span>
			<span style="left:20; position:relative"><xsl:value-of select="@Name" /></span>
			<xsl:call-template name="DisplayReport" />
		</ul>
	</xsl:for-each>
	<xsl:for-each select="THLENT">
		<ul style="left:10; position:relative"><b><xsl:value-of select="@Label" /></b>
			<span style="left:20; position:relative"><b><xsl:value-of select="@Name" /></b></span>
			<xsl:call-template name="DisplayReport" />
		</ul>    
	</xsl:for-each>
    <xsl:for-each select="THLENTDS">
      <ul style="left:10; position:relative"><b><xsl:value-of select="@Label" /></b>
        <span style="left:20; position:relative"><b><xsl:value-of select="@Name" /></b></span>
        <xsl:call-template name="DisplayReport" />
      </ul>
    </xsl:for-each>
    <xsl:for-each select="TENTSU">
      <ul style="left:10; position:relative"><b><xsl:value-of select="@Label" /></b>
        <span style="left:20; position:relative"><b><xsl:value-of select="@Name" /></b></span>
        <xsl:call-template name="DisplayReport" />
      </ul>
    </xsl:for-each>
    <xsl:for-each select="TSUBJ">
		<ul style="left:17; position:relative"><b><xsl:copy-of select="$varSubjectArea" /></b>
			<span style="left:20; position:relative"><b><xsl:value-of select="@Name" /></b></span>
			<xsl:call-template name="DisplayReport" />
		</ul>
	</xsl:for-each>
	<xsl:for-each select="TATTRUSR">
    <ul style="left:5; position:relative; width:300%">
      <xsl:call-template name="DisplayReport" />
    </ul>
	</xsl:for-each>
	<xsl:for-each select="TRELMM">
		<ul style="left:17; position:relative"><b><xsl:copy-of select="$varRelationship" /></b>
			<span style="left:20; position:relative"><b><xsl:value-of select="@Name" /></b></span>
			<xsl:call-template name="DisplayReport" />
		</ul>
	</xsl:for-each>
	<xsl:for-each select="TFNCDF">
		<ul style="left:17; position:relative"><b><xsl:copy-of select="$varFunction" /></b>
			<span style="left:20; position:relative"><b><xsl:value-of select="@Name" /></b></span>
			<xsl:call-template name="DisplayReport" />
		</ul>
	</xsl:for-each>
	<xsl:for-each select="TPRCDF">
		<ul style="left:17; position:relative"><b><xsl:copy-of select="$varProcess" /></b>
			<span style="left:20; position:relative"><b><xsl:value-of select="@Name" /></b></span>
			<xsl:call-template name="DisplayReport" />
		</ul>
	</xsl:for-each>
	<xsl:for-each select="TBUSSYS">
		<ul style="left:17; position:relative"><b><xsl:copy-of select="$varBusinessSystem" /></b>
			<span style="left:20; position:relative"><b><xsl:value-of select="@Name" /></b></span>
			<xsl:call-template name="DisplayReport" />
		</ul>
	</xsl:for-each>
	<xsl:for-each select="TBUSPROC">
		<ul style="left:17; position:relative"><b><xsl:copy-of select="$varProcedure" /></b>
			<span style="left:20; position:relative"><b><xsl:value-of select="@Name" /></b></span>
			<xsl:call-template name="DisplayReport" />
		</ul>
	</xsl:for-each>
	<xsl:for-each select="TBUSPRST">
		<ul style="left:17; position:relative"><b><xsl:copy-of select="$varProcedureStep" /></b>
			<span style="left:20; position:relative"><b><xsl:value-of select="@Name" /></b></span>
			<xsl:call-template name="DisplayReport" />
		</ul>
	</xsl:for-each>
	<xsl:for-each select="TRECDATA">
		<ul style="left:17; position:relative"><b><xsl:copy-of select="$varTable" /></b>
			<span style="left:20; position:relative"><b><xsl:value-of select="@Name" /></b></span>
			<xsl:call-template name="DisplayReport" />
		</ul>
	</xsl:for-each>
	<xsl:for-each select="TFIELDDA">
		<ul style="left:17; position:relative"><b><xsl:copy-of select="$varTable" /></b>
			<span style="left:20; position:relative"><b><xsl:value-of select="@Name" /></b></span>
			<xsl:call-template name="DisplayReport" />
		</ul>
	</xsl:for-each>
	<xsl:for-each select="TFIELDFK">
		<ul style="left:17; position:relative"><b><xsl:copy-of select="$varForeignKeyColumn" /></b>
			<span style="left:20; position:relative"><b><xsl:value-of select="@Label" /></b></span>
			<span style="left:30; position:relative"><b><xsl:copy-of select="$varwithinTable" /></b></span>
			<span style="left:40; position:relative"><b><xsl:value-of select="@Name" /></b></span>
			<xsl:call-template name="DisplayReport" />
		</ul>
	</xsl:for-each>
	<xsl:for-each select="TDATBAS2">
		<ul style="left:17; position:relative"><b><xsl:copy-of select="$varDatabase" /></b>
			<span style="left:20; position:relative"><b><xsl:value-of select="@Name" /></b></span>
			<xsl:call-template name="DisplayReport" />
		</ul>
	</xsl:for-each>
	<xsl:for-each select="TTECHDES">
		<ul style="left:17; position:relative"><b><xsl:value-of select="@Name" /></b>
			<span style="left:20; position:relative"><b><xsl:copy-of select="$varTechnicalDesign" /></b></span>
			<xsl:call-template name="DisplayReport" />
		</ul>
	</xsl:for-each>
	<xsl:for-each select="TACBLKBS">
		<ul style="left:10; position:relative"><b><xsl:value-of select="@Label" /></b>
			<span style="left:5; position:relative"><b><xsl:copy-of select="$varActionBlock" /></b></span>
			<span style="left:20; position:relative"><b><xsl:value-of select="@Name" /></b></span>
			<xsl:call-template name="DisplayReport" />
		</ul>
	</xsl:for-each>
	<xsl:for-each select="TSCREEN">
		<ul style="left:10; position:relative"><b><xsl:value-of select="@Label" /></b>
			<span style="left:5; position:relative"><b><xsl:copy-of select="$varScreen" /></b></span>
			<span style="left:20; position:relative"><b><xsl:value-of select="@Name" /></b></span>
			<xsl:call-template name="DisplayReport" />
		</ul>
	</xsl:for-each>
	<xsl:for-each select="TACBLKBA">
		<ul style="left:10; position:relative"><b><xsl:value-of select="@Label" /></b>
			<span style="left:5; position:relative"><b><xsl:copy-of select="$varActionBlock" /></b></span>
			<span style="left:20; position:relative"><b><xsl:value-of select="@Name" /></b></span>
			<xsl:call-template name="DisplayReport" />
		</ul>
	</xsl:for-each>
	<xsl:for-each select="TENTRYPN">
		<ul style="left:17; position:relative"><b><xsl:copy-of select="$varIndex" /></b>
			<span style="left:20; position:relative"><b><xsl:value-of select="@Name" /></b></span>
			<xsl:call-template name="DisplayReport" />
		</ul>
	</xsl:for-each>
  	<br />
	<xsl:apply-templates select="RPMSG"/>
	<xsl:apply-templates select="ErrorCounts"/>
</xsl:template>
  
  <xsl:template name="DisplayErrors">
	<xsl:param name="type" />
	<xsl:choose>
		<xsl:when test="$type != ''">
			<ul style="left:5; position:relative; width:300%"><xsl:value-of select="@Label" /><xsl:value-of select="$type" /></ul>
		</xsl:when>
		<xsl:otherwise>
			<xsl:choose>
				<xsl:when test="@Label">
					<ul style="left:5; position:relative; width:300%"><b><xsl:value-of select="@Label" />
						<span style="left:10; position:relative;"><xsl:value-of select="@Name" /></span>
						<span style="left:15; position:relative;"><xsl:value-of select="@SubLabel1" /></span>
						<span style="left:20; position:relative;"><xsl:value-of select="@SubName1" /></span>
						<span style="left:25; position:relative;"><xsl:value-of select="@SubLabel2" /></span>
						<span style="left:30; position:relative;"><xsl:value-of select="@SubName2" /></span></b>
					</ul>
				</xsl:when>
				<xsl:otherwise>
					<ul style="left:5; position:relative; width:300%"><b><xsl:value-of select="@Name" />
						<span style="left:10; position:relative;"><xsl:value-of select="@SubLabel1" /></span>
						<span style="left:20; position:relative;"><xsl:value-of select="@SubName1" /></span>
						<span style="left:25; position:relative;"><xsl:value-of select="@SubLabel2" /></span>
						<span style="left:30; position:relative;"><xsl:value-of select="@SubName2" /></span></b>
					</ul>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:otherwise>
	</xsl:choose>
	<xsl:for-each select="Error">
		<ul style="left:40; position:relative; width:300%">
			<xsl:choose>
	   			<xsl:when test="@Severity[.='1' or .= '2']"><xsl:copy-of select="$varERROR" /></xsl:when>
	   			<xsl:when test="@Severity[.='3']"><xsl:copy-of select="$varSEVEREWARNING" /></xsl:when>
	   			<xsl:otherwise><xsl:copy-of select="$varWARNING" /></xsl:otherwise>
			</xsl:choose>
   			<span style="left:120; position:absolute"><xsl:value-of select="@Description" /></span>
		</ul>
	</xsl:for-each>
	<br />
  </xsl:template>

  <xsl:template name="DisplayReport">
	<xsl:for-each select="TBUSAR">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TSUBJ">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="THLENT">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TPART">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TENTSU">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TATTRUSR">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TPERMVAL">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TRELMM">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TFNCDF">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TPRCDF">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TEFFCT">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TEVENT">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TEXTOBJ">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TGRPVW">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TENTVW">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TPRDVW">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TRELMMVW">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TACBLKBA">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TBUSSYS">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TBUSPROC">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TBUSPRST">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TDLGFLOW">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TSCREEN">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TSCRTMPL">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TSCRPDF">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TSCRLIT">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TSCRVAR">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TSCRSYS">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TPROMPT">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TCOMMAND">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TCMDSYN">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TPFSYS">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TPFLOCAL">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TEXSTATE">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TDEFEDIT">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TCSTEDIT">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TACBLKBS">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TDATBAS2">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TDATSETT">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TDATSETI">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TDATSTRT">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TDATSTRI">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TENTRYPN">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TFIELDDA">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TFIELDFK">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TRECDATA">
		<xsl:call-template name="DisplayErrors" >
			<xsl:with-param name="type"><xsl:value-of select="@Name" /></xsl:with-param>
		</xsl:call-template>
	</xsl:for-each>
	<xsl:for-each select="TRECLINK">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TENTD">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TENTS">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TACTSE">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TACTSQL">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TENTU">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TENTC">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TPRDAS">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
  <xsl:for-each select="TPRDRA">
      <xsl:call-template name="DisplayErrors" />
  </xsl:for-each>
	<xsl:for-each select="TLCLST">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TPRDAR">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TLCLRMV">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TCNTUSE">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TACTIF">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TACTWH">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TACTRE">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TACTFE">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TACTCO">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TPRDA">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TPRDRD">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TPRDRT">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TLCLES">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TLCLCM">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TACTMOVE">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TFLWESC">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TFLWNXT">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TLCLPRNT">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TLCLVA">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TACTUS">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TDVUIS">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TACTFL">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TPCROOT">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TFIELDNR">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TLINKFK">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="THLENTDS">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TRELIMMN">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TRELIMFK">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TRELIMEP">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TEXPVUS">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TBATCHJS">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TOLTRAN">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
		<xsl:for-each select="TWNUNIT">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TSTNDLST">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TDRPDWNE">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TSIMPCME">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TDRPDWNN">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TSPINBTN">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TRDBTNOC">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TWINPROM">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
  <xsl:for-each select="TWINPRIM">
    <xsl:call-template name="DisplayErrors" />
  </xsl:for-each>
	<xsl:for-each select="TTECHDES">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TSTORGRU">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TDATSEDU">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TMENUITE">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TPUSHBTN">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TMLTNFLD">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TSNGLNFL">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TCHKBOX">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TTABLSTB">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TBITMAP">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TRDOBTNI">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TEXDURAT">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TEXFUNC">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TEXPNVLD">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TEXPSUB">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TACTGMOD">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TDVUIP">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TDLGBOX">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TENTSTTU">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TDIATEXT">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TGETAR">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TIGNORER">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TCHECKR">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TLCLMC">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TLCLUC">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<xsl:for-each select="TRFRSHAC">
		<xsl:call-template name="DisplayErrors" />
	</xsl:for-each>
	<br />
	<xsl:apply-templates select="RPMSG"/>
	<xsl:apply-templates select="ErrorCounts"/>
  </xsl:template>

  <xsl:template match="ErrorCounts">
	<ul style="left:5; position:relative">
        <span style="left:10; position:relative"><b><xsl:copy-of select="$varNumberofERRORSColon" /></b></span>
        <span style="left:25; position:relative"><xsl:value-of select="@Errors" /></span>
        <span style="left:30; position:relative"><b><xsl:copy-of select="$varcomma" /></b></span>
        <span style="left:40; position:relative"><b><xsl:copy-of select="$varNumberofWARNINGSColon" /></b></span>
        <span style="left:55; position:relative"><xsl:value-of select="@Warnings" /></span>
	</ul>
  </xsl:template>
  
  <xsl:template match="RPMSG">
	<ul style="left:5; position:relative"><b>
        <span style="left:10; position:relative"><xsl:value-of select="@Message" /></span></b>
	</ul>
	<br />
  </xsl:template>
  
</xsl:stylesheet>
