# Created by: James Bailie <jimmy@mammothcheese.ca>
# $FreeBSD$

PORTNAME=	munger
PORTVERSION=	4.194
CATEGORIES=	lang
MASTER_SITES=	http://www.mammothcheese.ca/

MAINTAINER=	jimmy@mammothcheese.ca
COMMENT=	Static lisp interpreter with text processing abilities

LIB_DEPENDS=	tre.5:${PORTSDIR}/textproc/libtre

DATADIR=	${PREFIX}/share/${PORTNAME}-${PORTVERSION}

MAN1=		munger.1
MANCOMPRESSED=	yes

OPTIONS_DEFINE=	SQLITE
OPTIONS_DEFAULT=	SQLITE

USE_LDCONFIG=	yes

.include <bsd.port.options.mk>

.if ${PORT_OPTIONS:MSQLITE}
USE_SQLITE=	3
MAKE_ARGS+=	-DWITH_SQL
.endif

.if ${ARCH} == "sparc64"
BROKEN=		Does not link on sparc64
.endif

.include <bsd.port.mk>
