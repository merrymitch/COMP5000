<?xml version="1.0" encoding="UTF-8" ?>

<!--
Author:      Mary Mitchell (mem0250)
Course:      COMP5000-D01
Submission:  Assignment 4
Due Date: 	 March 28, 2023

File Name:   tgerental.xsl
Description: XSL stylesheet for the tgerentals xml vocabulary
Sources:	 The lecture 7 case study (Bowline Reality) and the course lectures. 
			 The style sheet used is also based on the Bowline Reality example.
 -->

<xsl:stylesheet version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
     
    <xsl:variable name="customerDoc" select="document('tgecustomers.xml')/customers/customer" />
    <xsl:variable name="toolDoc" select="document('tgetools.xml')/equipment/tool" />
    
    <xsl:key name="startDates" match="rental" use="Start_Date" />

   <xsl:output method="html"
      doctype-system="about:legacy-compat"
      encoding="UTF-8"
      indent="yes" />

   <xsl:template match="/">
	    <html>
			<head>
				<title>Current Rentals</title>
				<link href="tgestyles.css" rel="stylesheet" type="text/css" />
			</head>
				<body>
					<div id="wrap">
						<header>
							<img src="tgelogo.png" alt="The Good Earth" />
						</header>
						<h1>Current Rentals</h1>
						<xsl:for-each 
						select="//rental[generate-id()=generate-id(key('startDates', Start_Date)[1])]">
							<xsl:sort select="Start_Date" />
							<h2 id="{generate-id()}"><xsl:value-of select="Start_Date" /></h2>
							<table class="head" cellpadding="2">
								<tr>
									<th colspan="4">CUSTOMER</th>
									<th colspan="4">TOOL ID</th>
									<th colspan="4">TOOL</th>
									<th colspan="4">CATEGORY</th>
									<th colspan="2">DUE BACK</th>
									<th colspan="2">CHARGE</th>
								</tr>
								<xsl:apply-templates select="key('startDates', Start_Date)">
								</xsl:apply-templates>
							</table>
						</xsl:for-each>
					</div>
				</body>
		</html>
   </xsl:template>
   
   <xsl:template match="rental">
		<tr>
			<td colspan="4">
				<xsl:value-of select="$customerDoc[@custID = current()/Customer]/firstName" />
				<xsl:value-of select="$customerDoc[@custID = current()/Customer]/lastName" /> <br />
				<xsl:value-of select="$customerDoc[@custID = current()/Customer]/street" /> <br />
				<xsl:value-of select="$customerDoc[@custID = current()/Customer]/city" />,
				<xsl:value-of select="$customerDoc[@custID = current()/Customer]/state" /> &#160; <br />
				<xsl:value-of select="$customerDoc[@custID = current()/Customer]/ZIP" />
			</td>
			<td colspan="4">
				<xsl:value-of select="$toolDoc[@toolID = current()/Tool]/@toolID" />
			</td>
			<td colspan="4">
				<xsl:value-of select="$toolDoc[@toolID = current()/Tool]/description" />
			</td>
			<td colspan="4">
				<xsl:value-of select="$toolDoc[@toolID = current()/Tool]/category" />
			</td>
			<td colspan="2">
				<xsl:variable name="rentWeeks" select="Weeks" />
				<xsl:variable name="rentDays" select="Days" />
				<xsl:variable name="rentLength" select="($rentWeeks * 7) + $rentDays" />
				<xsl:variable name="yearValue" select="substring-before(Start_Date, '-')" />
				<xsl:variable name="monthValue" select="substring-before(substring-after(Start_Date, '-'), '-')" />
				<xsl:variable name="dayValue" select="substring-after(substring-after(Start_Date, '-'), '-')" />
				<xsl:choose>
					<xsl:when test="($dayValue + $rentLength) &gt; 31">
						<xsl:variable name="daysInMonth" select="31 - $dayValue" />
						<xsl:variable name="dueDay" select="$rentLength - $daysInMonth" />
						<xsl:variable name="newMonth" select="$monthValue + 1" />
						<xsl:variable name="dueBack" select="concat(number($newMonth), '-', number($dueDay), '-', $yearValue)" />
						<xsl:value-of select="$dueBack" />
					</xsl:when>
					<xsl:otherwise>
						<xsl:variable name="dueDay" select="$dayValue + $rentLength" />
						<xsl:variable name="dueBack" select="concat(number($monthValue), '-', number($dueDay), '-', $yearValue)" />
						<xsl:value-of select="$dueBack" /> 
					</xsl:otherwise>
				</xsl:choose>
			</td>
			<td colspan="2">
				<xsl:variable name="wRate" select="number($toolDoc[@toolID = current()/Tool]/weeklyRate)" />
				<xsl:variable name="dRate" select="number($toolDoc[@toolID = current()/Tool]/dailyRate)" />
				<xsl:variable name="charge" select="number(($wRate * Weeks) + ($dRate * Days))" />
				<xsl:value-of select="format-number($charge,'$###,###')" />
			</td>
		</tr>
   </xsl:template>
  
</xsl:stylesheet>

