# New ports collection makefile for:   libsigc++
# Date created:        30 September 2002
# Whom:                Martin Klaffenboeck <martin.klaffenboeck@gmx.at>
#
# $FreeBSD$
#

PORTNAME=	libsigc++
PORTVERSION=	1.2.7
PORTREVISION=	1
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GNOME}
MASTER_SITE_SUBDIR=	sources/${PORTNAME}/1.2
DIST_SUBDIR=	gnome2

MAINTAINER=	gnome@FreeBSD.org
COMMENT=	Callback Framework for C++

BUILD_DEPENDS=	gm4:${PORTSDIR}/devel/m4

USE_AUTOTOOLS=	libtool
USE_GMAKE=	yes
LATEST_LINK=	libsigc++12
USE_LDCONFIG=	yes
USE_GNOME=	gnomehack pkgconfig
GNU_CONFIGURE=	yes

.include <bsd.port.mk>
