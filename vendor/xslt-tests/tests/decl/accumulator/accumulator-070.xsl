<?xml version="1.0" encoding="UTF-8"?>
<xsl:package xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:f="http://accum001/"
  exclude-result-prefixes="xs f" version="3.0"  declared-modes="no" expand-text="yes">

  <!-- Test xsl:copy-of using copy-accumulators=true and validation=strict -->
 
  <xsl:import-schema>
    <xs:schema>
      <xs:element name="b" type="b-type"/>
      <xs:complexType name="b-type">
         <xs:sequence/>
      </xs:complexType>
    </xs:schema>
  </xsl:import-schema>

  <xsl:variable name="data">
    <doc><a/><b/><c/></doc>
  </xsl:variable>

  <xsl:accumulator name="f:elementNr" as="xs:integer" initial-value="0"
       streamable="false">
    <xsl:accumulator-rule match="*" select="$value + 1"/>
  </xsl:accumulator>
  
  <xsl:mode on-no-match="shallow-copy"/>
  
  <xsl:template match="b">
    <xsl:variable name="x" as="element()">
      <xsl:copy-of select="." copy-accumulators="yes" validation="strict"/>
    </xsl:variable>
    <xsl:for-each select="$x">
      <b-acc typed="{. instance of element(*, b-type)}">{accumulator-before('f:elementNr')}</b-acc>
    </xsl:for-each>
  </xsl:template>

  <xsl:template match="c">
    <c-acc>{accumulator-before('f:elementNr')}</c-acc>
  </xsl:template>
  
  <xsl:template name="xsl:initial-template" visibility="public">
    <xsl:apply-templates select="$data"/>
  </xsl:template>

</xsl:package>
