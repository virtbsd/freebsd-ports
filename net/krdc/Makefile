# $FreeBSD$

PORTNAME=	krdc
PORTVERSION=	${KDE4_VERSION}
CATEGORIES=	net kde ipv6
MASTER_SITES=	${MASTER_SITE_KDE}
MASTER_SITE_SUBDIR=	${KDE4_BRANCH}/${PORTVERSION}/src
DISTNAME=	kdenetwork-${PORTVERSION}
DIST_SUBDIR=	KDE/${PORTVERSION}

MAINTAINER=	kde@FreeBSD.org
COMMENT=	RDP and VNC client for KDE

LIB_DEPENDS=	vncserver.0:${PORTSDIR}/net/libvncserver \
		telepathy-qt4.2:${PORTSDIR}/net-im/telepathy-qt4

DISTINFO_FILE=	${.CURDIR}/../../net/kdenetwork4/distinfo

CONFLICTS_INSTALL=	kdenetwork-4.[1-8].*

USES=		cmake:outsource
USE_KDE4=	kdehier kdelibs kdeprefix automoc4
USE_QT4=	moc_build qmake_build rcc_build uic_build
USE_XZ=		yes
USE_LDCONFIG=	yes
MAKE_JOBS_SAFE=	yes

CMAKE_SOURCE_PATH=	${WRKSRC}/${PORTNAME}

.include <bsd.port.mk>
