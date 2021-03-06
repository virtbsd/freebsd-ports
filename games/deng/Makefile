# Created by: Igor Pokrovsky <ip@doom.homeunix.org>
# $FreeBSD$

PORTNAME=	deng
PORTVERSION=	1.9.0b6.9
PORTREVISION=	2
CATEGORIES=	games
MASTER_SITES=	SF/${PORTNAME}/Doomsday%20Engine/1.9.0-beta6.9
DISTNAME=	${PORTNAME}-${PORTVERSION:S/b/-beta/}

MAINTAINER=	ports@FreeBSD.org
COMMENT=	Enhanced Doom, Heretic, and Hexen source port

BUILD_DEPENDS=	zip:${PORTSDIR}/archivers/zip
LIB_DEPENDS=	curl.6:${PORTSDIR}/ftp/curl \
		png15:${PORTSDIR}/graphics/png
RUN_DEPENDS=	timidity:${PORTSDIR}/audio/timidity

USE_GL=		gl glu
USE_LDCONFIG=	yes
USE_SDL=	sdl mixer net
USE_XORG=	x11
USE_PYTHON=	yes
USES=		cmake:outsource
CMAKE_SOURCE_PATH=	${WRKSRC}/doomsday
CFLAGS+=	-I${LOCALBASE}/include/libpng15
CMAKE_ARGS+=	-DCMAKE_EXE_LINKER_FLAGS:STRING="-Wl,--export-dynamic"

MAN6=		doomsday.6

OPTIONS_DEFINE=	OPENAL DOCS
OPTIONS_DEFAULT=	DOCS
OPENAL_DESC=	Build OpenAL sound plugin

.include <bsd.port.options.mk>

.if ${PORT_OPTIONS:MOPENAL}
USE_OPENAL=	al
CMAKE_ARGS+=	-DBUILDOPENAL:BOOL=ON
PLIST_SUB=	OPENAL=""
.else
CMAKE_ARGS+=	-DBUILDOPENAL:BOOL=OFF
PLIST_SUB=	OPENAL="@comment "
.endif

post-patch:
	${REINPLACE_CMD} \
		-e '/CHECK_LIBRARY_EXIST/s/dl//' \
		-e '/TARGET_LINK_LIBRARIES/s/dl//' \
		${WRKSRC}/doomsday/CMakeLists.txt

post-install:
	@${LN} -s ${PREFIX}/bin/doomsday ${PREFIX}/bin/deng
	${INSTALL_MAN} ${WRKSRC}/doomsday/engine/doc/doomsday.6 ${MANPREFIX}/man/man6/
.if ${PORT_OPTIONS:MDOCS}
	@${MKDIR} ${DOCSDIR}
.for i in LICENSE changelog.txt cnsname.txt cvars.txt deddoc.txt dhistory.txt naming.txt network.txt
	${INSTALL_DATA} ${WRKSRC}/doomsday/engine/doc/${i} ${DOCSDIR}/
.endfor
.endif

.include <bsd.port.mk>
