# $FreeBSD$
#
# MAINTAINER: x11@FreeBSD.org
#
# Feature:	display
# Usage:	USES=display or USES=display:ARGS
# Valid ARGS:	install (default, implicit), build
# 
# Except the target where the DISPLAY is needed
#

.if !defined(_INCLUDE_USES_DISPLAY_MK)
_INCLUDE_USES_DISPLAY_MK=	yes

display_ARGS?=	install
.if ${display_ARGS} != build && ${display_ARGS} != install
IGNORE=	USES=display can only take 'build', 'install' and none
.endif

.if !defined(DISPLAY)
BUILD_DEPENDS+=	Xvfb:${PORTSDIR}/x11-servers/xorg-vfbserver \
	${LOCALBASE}/lib/X11/fonts/misc/8x13O.pcf.gz:${X_FONTS_MISC_PORT} \
	${LOCALBASE}/lib/X11/fonts/misc/fonts.alias:${X_FONTS_ALIAS_PORT} \
	${LOCALBASE}/share/X11/xkb/rules/base:${PORTSDIR}/x11/xkeyboard-config \
	xkbcomp:${PORTSDIR}/x11/xkbcomp

XVFBPORT!=	port=0; while test -S /tmp/.X11-unix/X$${port} ; do port=$$(( port + 1 )) ; done ; ${ECHO_CMD} $$port
XVFBPIDFILE=	/tmp/.xvfb-${XVFBPORT}.pid
MAKE_ENV+=	DISPLAY=":${XVFBPORT}"

pre-${display_ARGS}: start-display

post-${display_ARGS}: stop-display

start-display:
	daemon -p ${XVFBPIDFILE} Xvfb :${XVFBPORT}

stop-display:
	pkill -15 ${XVFBPIDFILE}

.endif
.endif
