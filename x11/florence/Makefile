# New ports collection makefile for:   Florence
# Date created:                2011/07/26
# Whom:                        Kris Moore <kmoore@freebsd.org>
#
# $FreeBSD$
#

PORTNAME=	florence
PORTVERSION=	0.5.0
PORTREVISION=	2
CATEGORIES=	x11
MASTER_SITES=	SF/florence/florence/${PORTVERSION}

MAINTAINER=	kmoore@FreeBSD.org
COMMENT=	Florence OnScreen Keyboard

LIB_DEPENDS=	notify.4:${PORTSDIR}/devel/libnotify \
		cspi.10:${PORTSDIR}/accessibility/at-spi

USE_XORG=	xtst
USE_GNOME=	gtk20 intlhack gnomedocutils gconf2 librsvg2 gnomepanel

USE_BZIP2=	yes
USES=		gettext iconv
USE_GMAKE=	yes
GNU_CONFIGURE=	yes
USE_LDCONFIG=	yes
INSTALLS_OMF=	yes
GCONF_SCHEMAS=	florence.schemas

CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

.include <bsd.port.mk>
