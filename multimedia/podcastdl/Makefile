# Created by: Rodrigo OSORIO <rodrigo@bebik.net>
# $FreeBSD$

PORTNAME=	podcastdl
PORTVERSION=	0.3.0
CATEGORIES=	multimedia
MASTER_SITES=	http://rodrigo.osorio.free.fr/freebsd/distfiles/ \
		http://files.bebik.net/podcastdl/

MAINTAINER=	rodrigo@bebik.net
COMMENT=	Simple command line podcast client written in plain C

LICENSE=	BSD

LIB_DEPENDS=	mrss:${PORTSDIR}/textproc/libmrss

USES=		cmake
MAKE_JOBS_SAFE=	yes

PLIST_FILES=	bin/podcastdl

.include <bsd.port.mk>
