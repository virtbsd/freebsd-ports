# New ports collection makefile for:	pgpdump
# Date created:				19 Jul 2000
# Whom:					TAKAHASHI Kaoru
#
# $FreeBSD$
#

PORTNAME=	pgpdump
PORTVERSION=	0.27
CATEGORIES=	security
MASTER_SITES=	http://www.mew.org/~kazu/proj/pgpdump/

MAINTAINER=	kaoru@kaisei.org
COMMENT=	PGP packet visualizer

GNU_CONFIGURE=	yes
MAKE_ARGS=	CFLAGS="${CFLAGS}"

MAN1=		pgpdump.1
PLIST_FILES=	bin/pgpdump

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/pgpdump ${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/pgpdump.1 ${MANPREFIX}/man/man1

.include <bsd.port.mk>
