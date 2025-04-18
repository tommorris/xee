<?xml version="1.0" encoding="UTF-8"?>
<t:transform xmlns:t="http://www.w3.org/1999/XSL/Transform" version="2.0">
  <!-- Purpose: Test of select in xsl:for-each with attribute() -->

  <t:template match="doc">
    <out>
      <t1>
        <t:for-each select="current()/attribute()">
          <t:sort select="."/>
          <t:value-of select="."/>
          <t:text>|</t:text>
        </t:for-each>
      </t1>
    </out>
  </t:template>

  <t:template match="text()"/>
</t:transform>
