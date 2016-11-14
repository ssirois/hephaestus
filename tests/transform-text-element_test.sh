# transform-text-element.sh -- tests the text element transformation
#
# The MIT Licence (MIT)
#
# Copyright (c) 2016 Samuel Sirois (sds) <samuel@sirois.info>
#
# Permission is hereby granted, free of charge, to any person obtaining a
# copy of this software and associated documentation files (the "Software"),
# to deal in the Software without restriction, including without limitation
# the rights to use, copy, modify, merge, publish, distribute, sublicense,
# and/or sell copies of the Software, and to permit persons to whom the
# Software is furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included
# in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN
# NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
# DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
# OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR
# THE USE OR OTHER DEALINGS IN THE SOFTWARE.

testThatATextIsTransformedAsASpanElement() {
  xmldoc="$xmldocHeader
  <page>
    <text></text>
  </page>"
  expected="<article><span></span></article>"
  actual=`echo ${xmldoc} | ${xsltprocCmd}`

  assertEquals "${expected}" "${actual}"
}

testThatATextElementContentFollowsAsSpanContent() {
  xmldoc="$xmldocHeader
  <page>
    <text>Hello World!</text>
  </page>"
  expected="<article><span>Hello World!</span></article>"
  actual=`echo ${xmldoc} | ${xsltprocCmd}`

  assertEquals "${expected}" "${actual}"
}

testThatTwoTextElementPositionnedOnYAxisPreserveThereOrderRegardlessOfThereSourceAppearanceOrder() {
  xmldoc="$xmldocHeader
  <page>
    <text top=\"200\">World</text>
    <text top=\"100\">Hello</text>
  </page>"
  expected="<article><span>Hello</span><span>World</span></article>"
  actual=`echo ${xmldoc} | ${xsltprocCmd}`

  assertEquals "${expected}" "${actual}"
}

testThatTwoTextElementPositionnedOnXAxisPreserveThereOrderRegardlessOfThereSourceAppearanceOrder() {
  xmldoc="$xmldocHeader
  <page>
    <text left=\"200\">World</text>
    <text left=\"100\">Hello</text>
  </page>"
  expected="<article><span>Hello</span><span>World</span></article>"
  actual=`echo ${xmldoc} | ${xsltprocCmd}`

  assertEquals "${expected}" "${actual}"
}

testThatFourTextElementsPositionnedOnXYAxesPreserveALogicalOrderRegardlessOfThereSourceAppearanceOrder() {
  xmldoc="$xmldocHeader
  <page>
    <text top=\"2\" left=\"2\">4</text>
    <text top=\"2\" left=\"1\">3</text>
    <text top=\"1\" left=\"2\">2</text>
    <text top=\"1\" left=\"1\">1</text>
  </page>"
  expected="<article><span>1</span><span>2</span><span>3</span><span>4</span></article>"
  actual=`echo ${xmldoc} | ${xsltprocCmd}`

  assertEquals "${expected}" "${actual}"
}

oneTimeSetUp() {
  xsltprocCmd='xsltproc --encoding UTF-8 src/xslt/pdf2xml.xslt -'
  xmldocHeader='<?xml version="1.0" encoding="UTF-8"?>'
}
