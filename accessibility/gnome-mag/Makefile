# New ports collection makefile for:	gnomemag
# Date created:			12 April 2003
# Whom:				Joe Marcus Clarke <marcus@FreeBSD.org>
#
# $FreeBSD$
#   $MCom: ports/accessibility/gnome-mag/Makefile,v 1.54 2010/10/31 11:01:52 kwm Exp $
#

PORTNAME=	gnome-mag
PORTVERSION=	0.16.3
PORTREVISION=	1
CATEGORIES=	accessibility gnome
MASTER_SITES=	GNOME
DIST_SUBDIR=	gnome2

MAINTAINER=	gnome@FreeBSD.org
COMMENT=	GNOME screen magnifier

USE_BZIP2=	yes
USE_XORG=	xfixes xdamage ice xcomposite sm
USE_GNOME=	gnomehack gnomeprefix atspi libbonobo intlhack ltverhack
USE_GMAKE=	yes
USES=		gettext
USE_AUTOTOOLS=	libtool
USE_LDCONFIG=	yes
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib

DOCSDIR=	${PREFIX}/share/doc/gnome-mag-${PORTVERSION}

MAN1=		magnifier.1

.include <bsd.port.mk>
