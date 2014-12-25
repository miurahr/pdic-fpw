#
# Copyright (C) 2007 Kazuhiro Ito
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#

PACKAGE = pdic-fpw-20070218
PACKAGEEXTRA = 
DIR = PDIC
SRCDIR = .
COPYRIGHT_FILE = 
SOURCES = ${SRCDIR}/HOUREI-20130119.dic  ${SRCDIR}/ICH-ALL.dic  ${SRCDIR}/wikipedia_corpus.dic

ARCHIVEEXTRA = pdic-fpw.conf makecat ChangeLog COPYING
FPWPARSER = fpwpdic
FPWPARSERFLAGS = ${SOURCES} ${COPYRIGHT_FILE}
ALLDEPS = catalogs.txt
CLEANEXTRA = catalogs.txt

.SUFFIXES:

include fpwutils.mk

catalogs.txt: pdic-fpw.conf
	${PERL} ./makecat

archive-directory:
	for file in README Makefile ${FPWPARSER} \
	   ${CGRAPHS} ${SOUNDS} ${HALFCHARS} ${FULLCHARS} ; do \
	   if test -f $$file ; then \
	      ${CPHIER} $$file ${ARCHIVEDIR}/$$file ; \
	   fi ; \
	done
	archiveextra='${ARCHIVEEXTRA}' ; \
	for file in $$archiveextra ; do \
	   case $$file in \
	   *=*) srcfile="`echo $$file | sed 's/=.*//'`" ; \
	        dstfile="`echo $$file | sed 's/.*=//'`" ; \
	        ${CPHIER} $$srcfile ${ARCHIVEDIR}/$$dstfile ;; \
	   *)   ${CPHIER} $$file ${ARCHIVEDIR}/$$file ;; \
	   esac ; \
	done
