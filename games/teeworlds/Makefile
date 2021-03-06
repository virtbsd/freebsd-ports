# Created by: Dmitry Marakasov <amdmi3@amdmi3.ru>
# $FreeBSD$

PORTNAME=	teeworlds
PORTVERSION=	0.6.1
PORTREVISION=	2
CATEGORIES=	games
MASTER_SITES=	http://www.teeworlds.com/files/ \
		http://mirror.amdmi3.ru/distfiles/ \
		http://github.com/downloads/matricks/bam/ \
		http://files.malikania.fr/distfiles/
DISTNAME=	${PORTNAME}-${PORTVERSION}-source
DISTFILES=	${DISTNAME}${EXTRACT_SUFX} bam-${BAM_VERSION}${EXTRACT_SUFX}

MAINTAINER=	amdmi3@FreeBSD.org
COMMENT=	Platform game featuring buggers equipped with weapons

LIB_DEPENDS=	freetype.9:${PORTSDIR}/print/freetype2

USE_PYTHON_BUILD=	yes

BAM_VERSION=	0.4.0
BAM_WRKSRC=	${WRKDIR}/bam-${BAM_VERSION}
BAM_TARGET=	release
MAKE_JOBS_SAFE=	yes
WRKSRC=		${WRKDIR}/teeworlds-b177-r50edfd37-source

PORTDOCS=	readme.txt license.txt

OPTIONS_DEFINE=	SERVER
SERVER_DESC=	Build dedicated server only

.include <bsd.port.options.mk>

.if ${ARCH} == "ia64"
BROKEN=		Does not install on ia64: gets bus error
.endif

.if ${PORT_OPTIONS:MSERVER}
BAM_TARGET=	server_release
PLIST_SUB+=	CLIENT="@comment "
PKGNAMESUFFX=	-server
.else
USE_XORG=	x11
USE_GL=		gl glu
USE_SDL=	sdl
PLIST_SUB+=	CLIENT=""
DESKTOP_ENTRIES="Teeworlds" \
		"Platform game featuring buggers equipped with weapons" \
		"${DATADIR}/Teeworlds.ico" \
		"teeworlds" \
		"Game;ActionGame;" \
		false
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|-O.||; s|-lpthread|${PTHREAD_LIBS}|; s|^gcc|${CC} ${CFLAGS}|; s|-ldl||g' \
		${BAM_WRKSRC}/make_unix.sh
	@${REINPLACE_CMD} -e 's|sdl-config|${SDL_CONFIG}|' ${WRKSRC}/other/sdl/sdl.lua
	@${REINPLACE_CMD} -e '/aDirs\[\]/,/}/ s|"/.*"|"${DATADIR}"|' \
		${WRKSRC}/src/engine/shared/storage.cpp
	@${REINPLACE_CMD} -e 's|gcc|${CC}|; s|g++|${CXX}|' \
		${BAM_WRKSRC}/src/driver_gcc.lua

# build bam executable - teeworlds own build system
pre-build:
	cd ${BAM_WRKSRC} && ${SH} -v make_unix.sh

# build teeworlds
do-build:
	cd ${WRKSRC} && ${SETENV} ${MAKE_ENV} \
		${BAM_WRKSRC}/bam -n -a -v ${_MAKE_JOBS:C/-j/-j /} ${BAM_TARGET}

do-install:
.if ! ${PORT_OPTIONS:MSERVER}
	${INSTALL_PROGRAM} ${WRKSRC}/teeworlds ${PREFIX}/bin
.endif
	${INSTALL_PROGRAM} ${WRKSRC}/teeworlds_srv ${PREFIX}/bin
	${MKDIR} ${DATADIR}
	@cd ${WRKSRC}/data && ${COPYTREE_SHARE} . ${DATADIR}/
	${INSTALL_DATA} ${WRKSRC}/other/icons/Teeworlds.ico ${DATADIR}
.if ${PORT_OPTIONS:MDOCS}
	${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/license.txt ${DOCSDIR}/
	${INSTALL_DATA} ${WRKSRC}/readme.txt ${DOCSDIR}/
.endif

.include <bsd.port.mk>
