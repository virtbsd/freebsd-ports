# New ports collection makefile for:	libticalcs
# Date created:		27 August 2003
# Whom:			Tijl Coosemans <tijl@ulyssis.org>
#
# $FreeBSD$
#

PORTNAME=	libticalcs
PORTVERSION=	4.6.1
PORTREVISION=	2
CATEGORIES=	devel
MASTER_SITES=		SF/tilp/OldFiles

MAINTAINER=	ports@FreeBSD.org
COMMENT=	TI calculator library

LIB_DEPENDS=	ticables.12:${PORTSDIR}/comms/libticables \
		tifiles.6:${PORTSDIR}/devel/libtifiles

DEPRECATED=	Superseded by comms/libticalcs2
EXPIRATION_DATE=2013-07-01

USES=		gettext
USE_GNOME=	gnomehack pkgconfig
USE_AUTOTOOLS=	libtool
USE_GMAKE=	yes
USE_LDCONFIG=	yes

.include <bsd.port.mk>
