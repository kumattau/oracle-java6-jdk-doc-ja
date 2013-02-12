#!/bin/sh

PACKAGE=oracle-java6-jdk-doc-ja
VERSION=6
DOC_URL=http://download.oracle.com/otndocs/jp/javadoc/java6_ja_apidocs.tar

# get tarball and create orig.tar.gz
curl ${DOC_URL} | tar xf -
(cd ja && find . -depth -print | cpio -pdum ../${PACKAGE}) && rm -fr ja
tar zcf ${PACKAGE}_${VERSION}.orig.tar.gz --exclude=debian ${PACKAGE}

# build debian package
cd ${PACKAGE} && debuild -us -uc
