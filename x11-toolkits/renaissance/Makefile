# New ports collection makefile for:    renaissance
# Date created:         07 Sep 2006
# Whom:                 gurkan@phys.ethz.ch
#
# $FreeBSD$
#

PORTNAME=	renaissance
PORTVERSION=	0.9.0
CATEGORIES=	x11-toolkits gnustep
MASTER_SITES=	http://www.gnustep.it/Renaissance/Download/
DISTNAME=	Renaissance-${PORTVERSION}

MAINTAINER=	ports@FreeBSD.org
COMMENT=	GNUstep GUI Development Framework

LICENSE=	LGPL21

USE_GNUSTEP=	yes
USE_GNUSTEP_BACK=	yes
USE_GNUSTEP_BUILD=	yes
USE_GNUSTEP_INSTALL=	yes
USE_GNUSTEP_LDCONFIG=	${GNUSTEP_SYSTEM_LIBRARIES}

WRKSRC=		${WRKDIR}/${DISTNAME}

post-patch:
	${ECHO_CMD} "GNUSTEP_INSTALLATION_DOMAIN=SYSTEM" \
		>>${WRKSRC}/Source/GNUmakefile

.include <bsd.port.mk>
