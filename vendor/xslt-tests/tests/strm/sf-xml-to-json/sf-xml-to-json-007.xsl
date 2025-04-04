<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    expand-text="yes"
    exclude-result-prefixes="#all" 
    version="3.0">
    
    <xsl:mode streamable="yes"/>
    
    <xsl:template match="/">
        <json>{xml-to-json(., map{'indent':true()})}</json>
    </xsl:template>
       
</xsl:stylesheet>