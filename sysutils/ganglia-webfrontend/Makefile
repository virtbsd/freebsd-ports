# $FreeBSD$

PORTNAME=	webfrontend
PORTVERSION=	3.1.7
PORTREVISION=	3
CATEGORIES=	sysutils net parallel www
MASTER_SITES=	SF/ganglia/ganglia%20monitoring%20core/${PORTVERSION}
PKGNAMEPREFIX=	ganglia-
DISTNAME=	ganglia-${PORTVERSION}

MAINTAINER=	skreuzer@FreeBSD.org
COMMENT=	Ganglia cluster monitor, web frontend

RUN_DEPENDS=	${LOCALBASE}/sbin/gmetad:${PORTSDIR}/sysutils/ganglia-monitor-core

PKGINSTALL=	${WRKDIR}/pkg-install
PKGMESSAGE=	${WRKDIR}/pkg-message

SUB_FILES+=	pkg-install pkg-message
SUB_LIST+=	WEBFRONTDIR="${WEBFRONTDIR}"

PLIST_SUB+=	WEBFRONTDIR="${WEBFRONTDIR}"

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	GANGLIA_ACK_SYSCONFDIR=1
CONFIGURE_WRKSRC=	${WRKDIR}/${DISTNAME}
USE_AUTOTOOLS=	autoconf

USE_PHP=	gd pcre xml ctype
WANT_PHP_MOD=	yes
WRKSRC=		${WRKDIR}/${DISTNAME}/web

# The Ganglia Web Frontend port supports a number of options that may be
# tweaked at buildtime.  Perform a "make options" to see more
# information on these variables.
WEBFRONTDIR?=	www/ganglia

# Set custom variables:
#
PKGOPTS=	${FILESDIR}/pkg-opts
EXCEPTFILES=	AUTHORS \
		ChangeLog \
		COPYING \
		Makefile \
		Makefile.am \
		Makefile.in \
		addons \
		webfrontend.spec \
		version.php.in
CPIOARGS=	--quiet -pdum -R
TMP_WEBFRONTDIR=	${WRKDIR}/webfrontend

options:
	@ ${ECHO_MSG} "===>  Build options for ${PKGNAME}:"
	@ ${CAT} ${PKGOPTS}

post-extract:
.if !defined(BATCH)
	@ ${TEST} -r ${PKGOPTS} && \
	    (${ECHO_MSG} '-------------------------------------------------------------------------'; \
	     ${ECHO_MSG} 'Perform a "make options" to see a list of available installation options.'; \
	     ${ECHO_MSG} '-------------------------------------------------------------------------')
.endif

post-patch:
	@ ${REINPLACE_CMD} -e "s|%%LOCALBASE%%|${LOCALBASE}|g" ${WRKSRC}/conf.php.in

do-build:
	@cd ${WRKSRC} && make install
	@${MKDIR} -m 0755 ${TMP_WEBFRONTDIR}
	@cd ${WRKSRC} && ${FIND} * \( -name conf.php\* \
	    ${EXCEPTFILES:S/^/-o -name /} -o -name \*.orig \) \
	    -a -prune -o -print \
	    | ${TAR} cTf - - | ${TAR} xUCf ${TMP_WEBFRONTDIR} -
	@${CP} ${WRKSRC}/conf.php ${TMP_WEBFRONTDIR}/conf.php.sample

do-install:
	@${MKDIR} -m 0755 ${PREFIX}/${WEBFRONTDIR}
	@${CHOWN} ${WWWOWN}:${WWWGRP} ${PREFIX}/${WEBFRONTDIR}
	@cd ${TMP_WEBFRONTDIR} && \
	    ${FIND} . | \
	    ${CPIO} ${CPIOARGS} ${WWWOWN}:${WWWGRP} ${PREFIX}/${WEBFRONTDIR}

post-install:
	@${SH} ${PKGINSTALL} ${PKGNAME} POST-INSTALL
	@${CAT} ${PKGMESSAGE}

build-plist:
	@${RM} ${PLIST}
	@${ECHO_CMD} '@unexec cmp -s %D/%%WEBFRONTDIR%%/conf.php %D/%%WEBFRONTDIR%%/conf.php.sample && ${RM} -f %D/%%WEBFRONTDIR%%/conf.php' >> ${PLIST}
	@${FIND} ${TMP_WEBFRONTDIR}/* -type f | \
	    ${SED} -e 's|${TMP_WEBFRONTDIR}|%%WEBFRONTDIR%%|' | \
	    ${SORT} >> ${PLIST}
	@${FIND} ${TMP_WEBFRONTDIR}/* -type d | \
	    ${SED} -e 's|${TMP_WEBFRONTDIR}|@dirrm %%WEBFRONTDIR%%|' | \
	    ${SORT} -r >> ${PLIST}
	@${ECHO_CMD} '@dirrmtry %%WEBFRONTDIR%%' >> ${PLIST}
	@${ECHO_CMD} '@unexec (test -d %D/%%WEBFRONTDIR%% && (echo "Configuration information saved.  If you will *NOT* use this package anymore," && echo "please remove %D/%%WEBFRONTDIR%% and its contents manually.")) || true' >> ${PLIST}

.include <bsd.port.mk>
