# New ports collection makefile for:	plasma-applet-panelspacer
# Date Created:				2008-10-03
# Whom:					Jason E. Hale <bsdkaffee@gmail.com>
#
# $FreeBSD$
#

PORTNAME=	panelspacer
PORTVERSION=	0.2
PORTREVISION=	8
CATEGORIES=	deskutils kde
MASTER_SITES=	http://danakil.free.fr/linux/releases/${PORTNAME}-${PORTVERSION}/
PKGNAMEPREFIX=	plasma-applet-
DISTNAME=	${PORTNAME}-plasmoid-${PORTVERSION}

MAINTAINER=	jhale@FreeBSD.org
COMMENT=	Panel spacer plasma applet for KDE4

USES=		cmake
USE_KDE4=	automoc4 kdeprefix workspace
USE_QT4=	gui dbus network opengl svg webkit xml \
		qmake_build moc_build rcc_build uic_build

WRKSRC=		${WRKDIR}/Panelspacer_from_svn_pour_kdelook-tmp

PLIST_FILES=	lib/kde4/plasma_applet_panelspacer.so \
		share/kde4/services/plasma-applet-panelspacer.desktop

.include <bsd.port.mk>
