# $FreeBSD$

PORTNAME=	javatari
PORTVERSION=	3.30
CATEGORIES=	emulators java
MASTER_SITES=	http://javatari.org/files/
DISTNAME=	${PORTNAME}330
EXTRACT_SUFX=	.jar
EXTRACT_ONLY=

MAINTAINER=	danilogondolfo@gmail.com
COMMENT=	Multiplayer Atari 2600 emulator written in pure Java

EXTRACT_DEPENDS=	${UNZIP_CMD}:${PORTSDIR}/archivers/unzip

USE_JAVA=	yes
JAVA_VERSION=	1.6+
NO_BUILD=	yes
PLIST_FILES=	%%JAVAJARDIR%%/${DISTNAME}${EXTRACT_SUFX} \
				bin/javatari
SUB_FILES=	javatari
SUB_LIST+=	JARFILE="${JARFILE}"
JARFILE=	${DISTNAME}${EXTRACT_SUFX}

DESKTOP_ENTRIES=	"Javatari" "${COMMENT}" "${PORTNAME}" "${PORTNAME}" "Application;Game;" ${FALSE}
PLIST_FILES+=	share/pixmaps/${PORTNAME}.png

post-extract:
	@(cd ${DISTDIR}/${DIST_SUBDIR} && ${UNZIP_CMD} -d ${WRKDIR} ${JARFILE} \
		org/javatari/pc/screen/images/LogoIcon32.png)

do-install:
	${INSTALL_DATA} ${DISTDIR}/${JARFILE} ${JAVAJARDIR}
	${INSTALL_SCRIPT} ${WRKDIR}/javatari ${PREFIX}/bin
	${INSTALL_DATA} ${WRKDIR}/org/javatari/pc/screen/images/LogoIcon32.png \
		${PREFIX}/share/pixmaps/${PORTNAME}.png

.include <bsd.port.mk>
