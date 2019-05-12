<?xml version="1.0"?> 
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

	<xsl:template match="/">
 	  <html>
	   <head>
	     <title>Triangle types</title>
               <style>
           	body {background-color:#F2F5A9; font-family:Arial, Helvetica, sans-serif}
           	h1.doesThirdSideRuleFail {color:#FF0000}
           	h1.hasAnySideNegativeValue {color:#FF0000}
           	h1.areAllSidesEqual {color:#00FF00}
	   	h1.areTwoSidesEqual {color:#0040FF}
	   	h1.isScalene {color: #000000}
               </style>
	   </head>
	   <body>
		<xsl:for-each select="/triangle-list/triangle">
		  <xsl:choose>
		    <xsl:when test="0>=side1 or 0>side2 or 0>side3">
	             <h1 class="hasAnySideNegativeValue">
		        <xsl:text>The triangle "</xsl:text>
		        <xsl:value-of select="name"/>
		        <xsl:text>" has sides </xsl:text>
		        <xsl:value-of select="side1"/>
		        <xsl:text>, </xsl:text>
		        <xsl:value-of select="side2"/>
		        <xsl:text>, </xsl:text>
		        <xsl:value-of select="side3"/>
		        <xsl:text> and it doesn't exist. It has side(s) with negative value(s)</xsl:text>
	              </h1>
		    </xsl:when>
		    <xsl:when test="side1>=side2+side3 or side2>=side1+side3 or side3>=side1+side2">
	              <h1 class="doesThirdSideRuleFail">
		        <xsl:text>The triangle "</xsl:text>
		        <xsl:value-of select="name"/>
		        <xsl:text>" has sides </xsl:text>
		        <xsl:value-of select="side1"/>
		        <xsl:text>, </xsl:text>
		        <xsl:value-of select="side2"/>
		        <xsl:text>, </xsl:text>
		        <xsl:value-of select="side3"/>
		        <xsl:text> doesn't exist...</xsl:text>
	              </h1>
		    </xsl:when>
		    <xsl:when test="side1=side2 and side1=side3">
	              <h1 class="areAllSidesEqual">
		        <xsl:text>The triangle "</xsl:text>
		        <xsl:value-of select="name"/>
		        <xsl:text>" has sides </xsl:text>
		        <xsl:value-of select="side1"/>
		        <xsl:text>, </xsl:text>
		        <xsl:value-of select="side2"/>
		        <xsl:text>, </xsl:text>
		        <xsl:value-of select="side3"/>
		        <xsl:text> is EQUILATERAL</xsl:text>
	              </h1>
		    </xsl:when>
		    <xsl:when test="side1=side2 or side1=side3 or side2=side3">
	              <h1 class="areTwoSidesEqual">
		        <xsl:text>The triangle "</xsl:text>
		        <xsl:value-of select="name"/>
		        <xsl:text>" has sides </xsl:text>
		        <xsl:value-of select="side1"/>
		        <xsl:text>, </xsl:text>
		        <xsl:value-of select="side2"/>
		        <xsl:text>, </xsl:text>
		        <xsl:value-of select="side3"/>
		        <xsl:text> is ISOSCELES</xsl:text>
	              </h1>
		    </xsl:when>
                    <xsl:otherwise>
                      <h1 class="isScalene">
		        <xsl:text>The triangle "</xsl:text>
		        <xsl:value-of select="name"/>
		        <xsl:text>" has sides </xsl:text>
			<xsl:value-of select="side1"/>
			<xsl:text>, </xsl:text>
			<xsl:value-of select="side2"/>
			<xsl:text>, </xsl:text>
			<xsl:value-of select="side3"/>
			<xsl:text> is SCALENE</xsl:text>                 
	              </h1>
                    </xsl:otherwise>
   	           </xsl:choose>
		</xsl:for-each>
	</body>
      </html>
   </xsl:template>
</xsl:stylesheet>

