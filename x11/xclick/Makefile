# New ports collection makefile for:	click
# Date created:		Ter 20 Fev 2007 07:53:32 UTC
# Whom:                 Mario Sergio Fujikawa Ferreira <lioux@FreeBSD.org>
#
# $FreeBSD$
#

PORTNAME=	xclick
PORTVERSION=	0.1
PORTREVISION=	2
CATEGORIES=	x11
MASTER_SITES=	http://members.shaw.ca/gehrehmee/ \
		http://bg.rifetech.com/
DISTNAME=	click
EXTRACT_SUFX=	.tgz

MAINTAINER=	lioux@FreeBSD.org
COMMENT=	Generates X11 mouse button click events

USE_XORG=	x11 xtst xext xfixes xi
MAKE_JOBS_SAFE=	yes

PLIST_FILES=	bin/${PORTNAME}

do-build:
	@cd ${WRKSRC} && \
		${CC} -L${LOCALBASE}/lib -I${LOCALBASE}/include click.c \
			-lX11 -lXtst -o ${PORTNAME}

do-install:
	@${INSTALL_PROGRAM} ${WRKSRC}/${PORTNAME} ${PREFIX}/bin

.include <bsd.port.mk>
