# Created by: Janos Mohacsi <janos.mohacsi@bsd.hu>
# $FreeBSD$

PORTNAME=	gpicview
PORTVERSION=	0.2.1
PORTREVISION=	4
CATEGORIES=	graphics
MASTER_SITES=	SF/lxde/GPicView%20%28image%20Viewer%29/GPicView%20${PORTVERSION}

MAINTAINER=	jmohacsi@bsd.hu
COMMENT=	A Simple and Fast Image Viewer for X

USE_GNOME=	gtk20
USE_GMAKE=	yes
GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	CPPFLAGS="-I${LOCALBASE}/include" \
		LDFLAGS="-L${LOCALBASE}/lib"

.include <bsd.port.options.mk>

.if ${PORT_OPTIONS:MNLS}
USES+=		gettext
PLIST_SUB+=	NLS=""
.else
CONFIGURE_ARGS+=--disable-nls
PLIST_SUB+=	NLS="@comment "
.endif

.include <bsd.port.mk>
