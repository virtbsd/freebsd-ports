# New ports collection makefile for:	pmt
# Date created:		2010-01-05
# Whom:			Greg Larkin <glarkin@FreeBSD.org>
#
# $FreeBSD$
#

PORTNAME=	pmt
PORTVERSION=	0.2
CATEGORIES=	sysutils
MASTER_SITES=	http://hansmi.ch/download/pmt/ \
		LOCAL/glarkin

MAINTAINER=	glarkin@FreeBSD.org
COMMENT=	A small collection of filters which can be added to UNIX pipes

USE_BZIP2=	yes
USE_GMAKE=	yes

PLIST_FILES=	bin/pmt

do-install:
	@${CP} ${WRKSRC}/pmt ${PREFIX}/bin

.include <bsd.port.pre.mk>
.if ${OSVERSION} >= 800071
EXTRA_PATCHES+=	${FILESDIR}/extra-patch-config.mak
.endif
.include <bsd.port.post.mk>
