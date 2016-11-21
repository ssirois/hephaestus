Ἥφαιστος (Hephaestus) 
=====================

* [![gitlab.com build status](https://gitlab.com/ssirois/hephaestus/badges/master/build.svg)](https://gitlab.com/ssirois/hephaestus/commits/master)
* [![travis.org Build Status](https://travis-ci.org/ssirois/hephaestus.svg?branch=master)](https://travis-ci.org/ssirois/hephaestus)

Raison d'être
-------------

I use PDFs as a last resort.  I actually only use them when a recipient
with whom i need to communicate really needs that format.  Why a simple
text email do not suffice, I don't know! ;) While I understand that it
is _easier_ to compact content and it's appearance inside a unique file
that can be interpreted and displayed _properly_ in _a click_ ?!

But there is nothing more irritating than navigating on the HTTP
protocol, one hyperlinked document to another and tripping over a god
damn PDF document without any HTML equivalent easily available.

Purpose
-------

This set of XSLT were made to complement default output of the pdftohtml
program.

By transforming the default XML output into a POSH HTML5 file, it ease
the editing work that I sometime wish to accomplish on the file.

Rationale
---------

Sometimes ``pdftohtml -s <document.pdf>`` or ``pdftotext <document.pdf>``
just does the job (when I just want to read).  Sometimes (when I want
to edit), I would prefer a ''cleaner'' HTML file to work with.

Colophon
--------

Ἥφαιστος (Hephaestus) is the Greek god of blacksmiths, craftsmen,
artisans, sculptors, … According to the myth, Ἥφαιστος had
an ugly appearance and was creating beautiful weapons.  Though this was
_à propos_ considering the purpose of this set of XSLT!
