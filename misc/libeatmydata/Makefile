# New ports collection makefile for:	libeatmydata
# Date created:				Sat Jan 16 20:41:35 CET 2010
# Whom:					Attila Nagy <bra@fsn.hu>
#
# $FreeBSD$
#

PORTNAME=	libeatmydata
PORTVERSION=	9
CATEGORIES=	misc
MASTER_SITES=	http://www.flamingspork.com/projects/libeatmydata/

MAINTAINER=	bra@fsn.hu
COMMENT=	a small LD_PRELOAD library designed to (transparently) disable fsync

USE_BZIP2=	yes
NO_MTREE=	yes
USE_LDCONFIG=	yes

PLIST_FILES=	lib/libeatmydata.so \
		lib/libeatmydata.so.1 \
		lib/libeatmydata.so.1.0

do-install:
	${INSTALL_DATA} ${WRKSRC}/libeatmydata.so.1.0 ${PREFIX}/lib

post-install:
	${LN} ${PREFIX}/lib/libeatmydata.so.1.0 ${PREFIX}/lib/libeatmydata.so.1
	${LN} ${PREFIX}/lib/libeatmydata.so.1.0 ${PREFIX}/lib/libeatmydata.so

.include <bsd.port.mk>
