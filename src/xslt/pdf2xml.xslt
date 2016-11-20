<?xml version="1.0" ?>
<!--
pdf2xml.xslt — declares transformation rules for a pdf2xml document

The MIT Licence (MIT)

Copyright (c) 2016 Samuel Sirois (sds) <samuel@sirois.info>

Permission is hereby granted, free of charge, to any person obtaining a
copy of this software and associated documentation files (the "Software"),
to deal in the Software without restriction, including without limitation
the rights to use, copy, modify, merge, publish, distribute, sublicense,
and/or sell copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included
in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN
NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR
THE USE OR OTHER DEALINGS IN THE SOFTWARE.
-->
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" />

  <xsl:template match="/pdf2xml">
    <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
    <xsl:element name="html">
      <xsl:apply-templates select="page" />
    </xsl:element>
  </xsl:template>

  <xsl:template match="page">
    <xsl:element name="article">
      <xsl:if test="@number != ''">
        <xsl:attribute name="data-page-number">
          <xsl:value-of select="@number" />
        </xsl:attribute>
      </xsl:if>
      <xsl:for-each select="text">
        <xsl:sort select="@top" data-type="number" />
        <xsl:sort select="@left" data-type="number" />

        <xsl:element name="span">
          <xsl:value-of select="." />
        </xsl:element>
      </xsl:for-each>
    </xsl:element>
  </xsl:template>
</xsl:stylesheet>
