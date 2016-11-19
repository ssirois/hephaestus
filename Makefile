# Makefile -- helps manage hephaestus sources
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

rwildcard=$(wildcard $1$2) $(foreach d,$(wildcard $1*),$(call rwildcard,$d/,$2))
TEST_FILES:=$(call rwildcard,./tests/,*_test.sh)
TEST_TARGETS=$(patsubst %,check_%,$(TEST_FILES))

PDFTOHTML=`which pdftohtml`
XSLTPROC=`which xsltproc`

.PHONY: check
check: $(TEST_TARGETS)

check_%:
	shunit2 $(*)

check_./%:
	shunit2 $(*)

build-example-artifacts: artifacts-dir artifacts/speak-white_michele-lalonde.xml artifacts/speak-white_michele-lalonde.html

artifacts/speak-white_michele-lalonde.xml: artifacts-dir
	$(PDFTOHTML) -xml assets/speak-white_michele-lalonde.pdf artifacts/speak-white_michele-lalonde.xml

artifacts/speak-white_michele-lalonde.html: artifacts/speak-white_michele-lalonde.xml
	$(XSLTPROC) --novalid --encoding UTF-8 --output artifacts/speak-white_michele-lalonde.html src/xslt/pdf2xml.xslt artifacts/speak-white_michele-lalonde.xml

artifacts-dir: artifacts

artifacts:
	mkdir ./artifacts
