# Created by: lx
# $FreeBSD$

PORTNAME=	samhain
PORTVERSION=	3.0.12
CATEGORIES=	security
MASTER_SITES=	http://la-samhna.de/archive/ \
		http://redundancy.redundancy.org/mirror/
DISTNAME=	samhain_signed-${PORTVERSION}

MAINTAINER=	lx@FreeBSD.org
COMMENT=	The Samhain Intrusion Detection System

LICENSE=	GPLv2

OPTIONS_DEFINE=	KCHECK GPG MYSQL PGSQL XML_LOGS LIBWRAP PRELUDE
OPTIONS_DEFAULT=	XML_LOGS LIBWRAP
KCHECK_DESC=	Enable rogue KLD detection
GPG_DESC=	Enable GnuPG support
MYSQL_DESC=	Enable MySQL logging
PGSQL_DESC=	Enable PostgreSQL logging
XML_LOGS_DESC=	Enable XML-formatted logs
LIBWRAP_DESC=	Enable TCP wrapper support
PRELUDE_DESC=	Enable Prelude Framework support

SUB_FILES+=	pkg-install

WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION}

CONFLICTS=	samhain-client-2*

.include <bsd.port.pre.mk>

.if ${ARCH} == "amd64"
CFLAGS+=	-fPIC
.endif

.if ${OSVERSION} > 800000 && ${ARCH} == "amd64"
MANUAL_PACKAGE_BUILD=	fails to link on pointyhat
.endif

.if ${OSVERSION} > 900007
EXTRA_PATCHES+= ${PATCHDIR}/extra-patch-config-h-in
.endif

.if ${PORT_OPTIONS:MGPG}
BUILD_DEPENDS+=	gpg:${PORTSDIR}/security/gnupg
.endif

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--enable-login-watch --localstatedir=/var \
		--enable-suidcheck

.if ${PORT_OPTIONS:MXML_LOGS}
CONFIGURE_ARGS+=	--enable-xml-log
.endif
.if defined(WITH_RUNAS_USER)
CONFIGURE_ARGS+=	--enable-identity=${WITH_RUNAS_USER}
.else
CONFIGURE_ARGS+=	--enable-identity=yule
.endif
.if ${PORT_OPTIONS:MKCHECK}
CONFIGURE_ARGS+=	--with-kcheck
.endif
.if ${PORT_OPTIONS:MGPG}
CONFIGURE_ARGS+=	--with-gpg=${PREFIX}/bin/gpg
.endif
.if ${PORT_OPTIONS:MMYSQL}
CONFIGURE_ARGS+=	--with-database=mysql \
			--with-cflags=-I${LOCALBASE}/include/mysql \
			--with-libs=-L${LOCALBASE}/lib/mysql
.endif
.if ${PORT_OPTIONS:MPGSQL}
CONFIGURE_ARGS+=	--with-database=postgresql
.endif
.if ${PORT_OPTIONS:MLIBWRAP}
CONFIGURE_ARGS+=	--with-libwrap
.endif
.if ${PORT_OPTIONS:MCLIENT}
CONFIGURE_ARGS+=	--enable-network=client \
		--with-data-file=REQ_FROM_SERVER/var/lib/samhain/data.samhain \
		--with-config-file=REQ_FROM_SERVER
PLIST_SUB+=	SAMHAIN="" SETPWD="" YULE="@comment "
EXTRA_PATCHES+=	${FILESDIR}/fixsamhainrc.patch
MAN5+=	samhainrc.5
MAN8+=	samhain.8
.elif ${PORT_OPTIONS:MSERVER}
CONFIGURE_ARGS+=	--enable-network=server
SUB_LIST+=	WITH_YULE="yes"
PLIST_SUB+=	YULE="" SAMHAIN="@comment " SETPWD="@comment "
EXTRA_PATCHES+=	${FILESDIR}/fixyulerc.patch
MAN5+=	yulerc.5
MAN8+=	yule.8
.else
SUB_LIST+=	WITH_YULE=""
PLIST_SUB+=	SAMHAIN="" YULE="@comment " SETPWD="@comment "
EXTRA_PATCHES+=	${FILESDIR}/fixsamhainrc.patch
MAN5+=	samhainrc.5
MAN8+=	samhain.8
.endif
.if ${PORT_OPTIONS:MLOG_SERVER}
CONFIGURE_ARGS+=	--with-logserver=true
.endif
.if ${PORT_OPTIONS:MALT_LOG_SERVER}
CONFIGURE_ARGS+=	--with-altlogserver=true
.endif
.if ${PORT_OPTIONS:MPRELUDE}
LIB_DEPENDS+=		prelude:${PORTSDIR}/security/libprelude
CONFIGURE_ARGS+=	--with-prelude
.endif

pre-everything::

.if !defined(WITH_CLIENT) && !defined(WITH_SERVER)
	@${ECHO_MSG}
	@${ECHO_MSG} "Building Samhain in standalone mode."
	@${ECHO_MSG} "If you wish to enable networked mode, please hit CTRL-C"
	@${ECHO_MSG} "now, and build samhain from the samhain-client and"
	@${ECHO_MSG} "samhain-server ports."
	@${ECHO_MSG}
.endif

.if defined(WITH_CLIENT) && defined(WITH_SERVER)
IGNORE=		can't build client and server at once
.endif

.if ${PORT_OPTIONS:MKCHECK}
	@${ECHO_MSG}
	@${ECHO_MSG} "Building with kernel checking requires reading /dev/kmem"
	@${ECHO_MSG} "and /dev/mem. If you're not building as root, please hit"
	@${ECHO_MSG} "Control-C and restart the build as root."
	@${ECHO_MSG}
.endif

.if ${PORT_OPTIONS:MMYSQL} && ! ${PORT_OPTIONS:MXML_LOGS}
IGNORE=		XML logging is required to log to MySQL
.endif

.if ${PORT_OPTIONS:MPGSQL} && ! ${PORT_OPTIONS:MXML_LOGS}
IGNORE=		XML logging is required to log to Postgres
.endif

post-extract:
	@${TAR} -C ${WRKDIR} -xzf ${WRKSRC}.tar.gz
	@${RM} ${WRKSRC}.tar.gz ${WRKSRC}.tar.gz.asc

pre-install:
	@PREFIX=${PREFIX} ${SH} ${PKGINSTALL} ${PKGNAME} PRE-INSTALL

post-install:
.if !defined(WITH_SERVER)
	@${CP} ${WRKSRC}/init/samhain.startFreeBSD ${PREFIX}/etc/rc.d/samhain.sh
	@${CP} ${WRKSRC}/samhainrc ${PREFIX}/etc/samhainrc.sample
	@${CHGRP} wheel ${PREFIX}/etc/samhainrc.sample
.else
	@${CP} ${WRKSRC}/init/samhain.startFreeBSD ${PREFIX}/etc/rc.d/yule.sh
	@${CP} ${WRKSRC}/yulerc ${PREFIX}/etc/yulerc.sample
.endif
.if ${PORT_OPTIONS:MDOCS}
	${MKDIR} ${DOCSDIR}
	${INSTALL_MAN} ${WRKSRC}/docs/MANUAL-2_3.pdf ${DOCSDIR}
	${INSTALL_MAN} ${WRKSRC}/docs/HOWTO-client+server.html ${DOCSDIR}
	${INSTALL_MAN} ${WRKSRC}/docs/HOWTO-client+server-troubleshooting.html ${DOCSDIR}
	${INSTALL_MAN} ${WRKSRC}/docs/HOWTO-samhain+GnuPG.html ${DOCSDIR}
	${INSTALL_MAN} ${WRKSRC}/docs/HOWTO-write-modules.html ${DOCSDIR}
	${INSTALL_MAN} ${WRKSRC}/docs/FAQ.html ${DOCSDIR}
	${INSTALL_MAN} ${WRKSRC}/docs/README.UPGRADE ${DOCSDIR}
	${INSTALL_MAN} ${WRKSRC}/docs/README ${DOCSDIR}
	${INSTALL_MAN} ${WRKSRC}/docs/BUGS ${DOCSDIR}
	${INSTALL_MAN} ${WRKSRC}/docs/sh_mounts.txt ${DOCSDIR}
	${INSTALL_MAN} ${WRKSRC}/docs/sh_userfiles.txt ${DOCSDIR}
.endif

	@${CAT} ${PKGMESSAGE}
.include <bsd.port.post.mk>
