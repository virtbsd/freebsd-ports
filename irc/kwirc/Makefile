# New ports collection makefile for:	kwirc
# Date created:			Mon Mar 15 12:38:09 CET 2004
# Whom:				Markus Brueffer <markus@FreeBSD.org>
#
# $FreeBSD$
#

PORTNAME=	kwirc
PORTVERSION=	0.1.0
PORTREVISION=	10
CATEGORIES=	irc kde
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}/${PORTVERSION}%20_sexybaby_

MAINTAINER=	ports@FreeBSD.org
COMMENT=	IRC client for KDE

DEPRECATED=	Depends on QT3; unmaintained
EXPIRATION_DATE=	2013-07-01

USE_KDELIBS_VER=3
USE_AUTOTOOLS=	libtool
USE_BZIP2=	yes
USE_GMAKE=	yes

post-patch:
	@${REINPLACE_CMD} -e 's|-O2||g' ${WRKSRC}/${CONFIGURE_SCRIPT}

.include <bsd.port.mk>
