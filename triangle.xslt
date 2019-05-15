<?xml version="1.0"?> 
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="/">
		<html>
			<head>
				<title>Triangle types</title>
		        <style>
		           	body {background-color:#F2F5A9; font-family:Arial, Helvetica, sans-serif}
		           	h1.INVALID {color:#FF0000}
		           	h1.EQUILATERAL {color:#00FF00}
			   		h1.ISOSCELES {color:#0040FF}
			   		h1.SCALENE {color: #000000}
		        </style>
			</head>
			<body>
				<xsl:for-each select="/triangle-list/triangle">
					<xsl:call-template name="triangle_summary">
			        	<xsl:with-param name="triangle" select="."/>
			      	</xsl:call-template>
				</xsl:for-each>
			</body>
		</html>
	</xsl:template>

	<xsl:template name="triangle_summary">
		<xsl:param name="triangle"/>

		<xsl:variable name="triangle_type">
			<xsl:call-template name="get_triangle_type">
				<xsl:with-param name="triangle" select="."/>
			</xsl:call-template>
		</xsl:variable>
		<xsl:variable name="joined_sides">
			<xsl:call-template name="join_triangle_sides">
				<xsl:with-param name="sides" select="*"/>
			</xsl:call-template>
		</xsl:variable>

		<h1>
			<xsl:attribute name="class">
				<xsl:value-of select="$triangle_type"/>
			</xsl:attribute>
			<xsl:text>Triangle with name '</xsl:text>
			<xsl:value-of select="@name"/>
			<xsl:text>' that has sides </xsl:text>
			<xsl:value-of select="$joined_sides"/>    
			<xsl:text> is </xsl:text>   
			<xsl:value-of select="$triangle_type"/>              
		</h1>
	</xsl:template>

	<xsl:template name="get_triangle_type">
		<xsl:param name="triangle"/>
		
		<xsl:choose>
			<xsl:when test="side1 &lt; 0 or side2 &lt; 0 or side3 &lt; 0">
				<xsl:text>INVALID</xsl:text>
			</xsl:when>
			<xsl:when test="side1 &gt;= side2+side3 or side2 &gt;= side1+side3 or side3 &gt;= side1+side2">
				<xsl:text>INVALID</xsl:text>
			</xsl:when>
			<xsl:when test="side1 = side2 and side1 = side3">
				<xsl:text>EQUILATERAL</xsl:text>
			</xsl:when>
			<xsl:when test="side1 = side2 or side1 = side3 or side2 = side3">
				<xsl:text>ISOSCELES</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text>SCALENE</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="join_triangle_sides" >
		<xsl:param name="sides" select="''"/>
		<xsl:param name="separator" select="','"/>
		
		<xsl:for-each select="$sides">
			<xsl:choose>
				<xsl:when test="position() = 1">
					<xsl:value-of select="."/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="concat($separator, .) "/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>

</xsl:stylesheet>
