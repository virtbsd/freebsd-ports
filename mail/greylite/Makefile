# Created by: Mij <mij@bitchx.it>
# $FreeBSD$

PORTNAME=	greylite
PORTVERSION=	2.3
PORTREVISION=	1
CATEGORIES=	mail
MASTER_SITES=	http://mij.oltrelinux.com/net/greylite/releases/

MAINTAINER=	mij@bitchx.it
COMMENT=	Modified greylisting for qmail and for any other MDA

RUN_DEPENDS=	tcpserver:${PORTSDIR}/sysutils/ucspi-tcp

USE_BZIP2=	yes
USE_SQLITE=	3
PLIST_FILES=	bin/greylite \
		%%DNSBLENV%%bin/dnsblenv	\
		%%UCSPI2SOCKET%%bin/ucspi2socket

MAN8=		greylite.8
MANCOMPRESSED=	yes

OPTIONS_DEFINE=	GEOIP DNSBLENV UCSPI2SOCKET
OPTIONS_DEFAULT=	GEOIP DNSBLENV UCSPI2SOCKET
GEOIP_DESC=		Support for GeoIP in suspicion rules
DNSBLENV_DESC=		Module for interfacing with DNS blacklists
UCSPI2SOCKET_DESC=	Module for using greylite as SMTP proxy

.include <bsd.port.pre.mk>

.if ${PORT_OPTIONS:MGEOIP}
LIB_DEPENDS+=	GeoIP:${PORTSDIR}/net/GeoIP
MAKE_ARGS+=	WITH_GEOIP=yep
.endif

.if ${PORT_OPTIONS:MDNSBLENV}
LIB_DEPENDS+=	cares:${PORTSDIR}/dns/c-ares
MAKE_ARGS+=	WITH_DNSBLENV=yep
PLIST_SUB+=	DNSBLENV=""
.else
PLIST_SUB+=	DNSBLENV="@comment "
.endif

.if ${PORT_OPTIONS:MUCSPI2SOCKET}
MAKE_ARGS+=	WITH_UCSPI2SOCKET=yep
PLIST_SUB+=	UCSPI2SOCKET=""
.else
PLIST_SUB+=	UCSPI2SOCKET="@comment "
.endif

post-patch:
	${CP} ${WRKSRC}/Makefile.bsdmake ${WRKSRC}/Makefile

do-build:
	${MAKE} -C ${WRKSRC} ${MAKE_ARGS}

post-install:
	@${CAT} pkg-message

.include <bsd.port.post.mk>
