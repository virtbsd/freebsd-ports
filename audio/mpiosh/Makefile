# New ports collection makefile for:	mpio-driver
# Date created:				19 Jun 2003
# Whom:					Sergey Akifyev <asa@gascom.ru>
#
# $FreeBSD$
#

PORTNAME=	mpiosh
PORTVERSION=	0.7.1.p2
PORTREVISION=	2
CATEGORIES=	audio
MASTER_SITES=	SF/mpio/mpio%20pre-release/0.7.1-pre2
DISTNAME=	mpio-${PORTVERSION:S|.p|_pre|}

MAINTAINER=	ports@FreeBSD.org
COMMENT=	Digit@lway MPIO MP3 player tool

USES=		iconv
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes

USE_AUTOTOOLS=	aclocal automake autoconf libtool
ACLOCAL_ARGS=	-I . -I ${LOCALBASE}/share/aclocal
AUTOMAKE_ARGS=	--add-missing
CFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib -liconv

.include <bsd.port.pre.mk>

EXTRA_PATCHES=	${FILESDIR}/extra-patch-configure.in

post-patch:
	${RM} -f ${WRKSRC}/configure

.include <bsd.port.post.mk>
