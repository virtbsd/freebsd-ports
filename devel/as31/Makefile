# Created by: Volker Stolz <stolz@i2.informatik.rwth-aachen.de>
# $FreeBSD$

PORTNAME=	as31
PORTVERSION=	2.0.b3
PORTREVISION=	6
CATEGORIES=	devel
MASTER_SITES=	http://www.pjrc.com/tech/8051/tools/
DISTNAME=	${PORTNAME}_beta3

MAINTAINER=	ports@FreeBSD.org
COMMENT=	A free 8051 assembler

.ifndef(WITHOUT_X11)
USE_GNOME=	gtk12
PLIST_SUB+=	X11=""
.else
ALL_TARGET=	as31
PLIST_SUB+=	X11="@comment "
.endif
USES=		bison

WRKSRC=		${WRKDIR}/${PORTNAME}
MAKE_ARGS=	CC="${CC}" CFLAGS="${CFLAGS}"

MAN1=		as31.1
PLIST_FILES=	bin/as31 %%X11%%bin/as31_gtk

do-install:
	@${INSTALL_PROGRAM} ${WRKSRC}/as31 ${PREFIX}/bin
	@${INSTALL_MAN} ${WRKSRC}/as31.1 ${MANPREFIX}/man/man1
.ifndef(WITHOUT_X11)
	@${INSTALL} ${WRKSRC}/as31_gtk ${PREFIX}/bin
.endif

.include <bsd.port.mk>
