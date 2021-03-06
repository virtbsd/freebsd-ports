# $FreeBSD$

PORTNAME=	pkg
DISTVERSION=	1.1.0.rc1
CATEGORIES=	ports-mgmt
MASTER_SITES=	http://files.etoilebsd.net/pkg/ \
		http://mirror.shatow.net/freebsd/${PORTNAME}/ \
		LOCAL/portmgr

MAINTAINER=	portmgr@FreeBSD.org
COMMENT=	New generation package manager

LICENSE=	BSD

USE_XZ=		yes

MAKE_JOBS_SAFE=	yes
# Disable CCACHE support because of the chicken/egg problem pkg should always
# With no dependency at all
NO_CCACHE=	yes
USE_LDCONFIG=	yes
MANCOMPRESSED=	yes

MAKE_ENV+=	WITHOUT_PROFILE=yes __MAKE_CONF=/dev/null SRCCONF=/dev/null \
		PORTREVISION=${PORTREVISION}
USE_STAGE=	yes
# Use a submake as 'deinstall install' needs to reevaluate PKG_CMD
# so that pkg-static is used from the wrkdir
USE_SUBMAKE=	yes

MAN8=	pkg.8 \
	pkg-add.8 \
	pkg-annotate.8 \
	pkg-autoremove.8 \
	pkg-audit.8 \
	pkg-backup.8 \
	pkg-check.8 \
	pkg-clean.8 \
	pkg-convert.8 \
	pkg-create.8 \
	pkg-delete.8 \
	pkg-fetch.8 \
	pkg-info.8 \
	pkg-install.8 \
	pkg-lock.8 \
	pkg-query.8 \
	pkg-register.8 \
	pkg-repo.8 \
	pkg-rquery.8 \
	pkg-search.8 \
	pkg-set.8 \
	pkg-shell.8 \
	pkg-shlib.8 \
	pkg-stats.8 \
	pkg-update.8 \
	pkg-updating.8 \
	pkg-upgrade.8 \
	pkg-version.8 \
	pkg-which.8
MAN5=	pkg.conf.5
MAN3=	pkg_printf.3
MLINKS=	pkg-delete.8 pkg-remove.8 \
	pkg-lock.8 pkg-unlock.8 \
	pkg.8 pkg-static.8

.include <bsd.port.pre.mk>

.if defined(WITH_PKGNG)
.if ${WITH_PKGNG} != devel
NO_LATEST_LINK=	yes
IGNORE=	WITH_PKGNG is not defined to 'devel', this version is the devel one
.endif
.if exists(${LOCALBASE}/sbin/pkg_info) || exists(/usr/sbin/pkg_info)
NB_OLDPKGS!=	pkg_info 2>/dev/null | wc -l
.if exists(${PKG_BIN})
NB_NEWPKGS!=	${PKG_INFO} -aq | wc -l
.else
NB_NEWPKGS=	0
.endif
# Only show the pre-everything notice if they have not already
# converted any packages
.if ${NB_OLDPKGS} > 0 && ${NB_NEWPKGS} == 0

pre-everything::
	@${ECHO_CMD} "You are about to convert your system to pkgng while you have ports/packages"; \
	 ${ECHO_CMD} "installed with the old pkg_install tools."; \
	 ${ECHO_CMD} ""; \
	 ${ECHO_CMD} "You can choose to: "; \
	 ${ECHO_CMD} "- keep pkg_install as the package management system by adding this line to /etc/make.conf:"; \
	 ${ECHO_CMD} ""; \
	 ${ECHO_CMD} "    WITHOUT_PKGNG=yes" ; \
	 ${ECHO_CMD} ""; \
	 ${ECHO_CMD} "- switch to pkgng:"; \
	 ${ECHO_CMD} "    1) Add WITHOUT_PKGNG to /etc/make.conf"; \
	 ${ECHO_CMD} "    2) Install ports-mgmt/pkg"; \
	 ${ECHO_CMD} "    3) Convert your package database by running pkg2ng"; \
	 ${ECHO_CMD} "    4) Remove WITHOUT_PKGNG from /etc/make.conf"; \
	 ${ECHO_CMD} ""; \
	exit 1

.endif
.endif
.else
LATEST_LINK=	pkg-devel
.endif

#define PKG_DEPENDS to nothing to avoid infinite loop looking for pkg :)
.if defined(WITH_PKGNG)
PKG_DEPENDS=
.undef INSTALLS_DEPENDS
.if !exists(${LOCALBASE}/sbin/pkg)
PKG_BIN=	${WRKSRC}/pkg-static/pkg-static
.endif
.endif

.if ${OSVERSION} < 800505
IGNORE=		not supported on 7.x or early 8.0
.endif

PERIODIC_DAILY=		400.status-pkg 411.pkg-backup 490.status-pkg-changes
PERIODIC_SECURITY=	410.pkg-audit 460.pkg-checksum
PERIODIC_ALL=		${PERIODIC_DAILY} ${PERIODIC_SECURITY}

post-install:
.for periodic in ${PERIODIC_ALL}
	@${REINPLACE_CMD} -e 's|/usr/local|${PREFIX}|g' ${WRKSRC}/scripts/periodic/${periodic}
.endfor
	@${MKDIR} ${PREFIX}/etc/periodic/security
	@${MKDIR} ${PREFIX}/etc/periodic/daily
.for periodic in ${PERIODIC_DAILY}
	@${INSTALL_SCRIPT} ${WRKSRC}/scripts/periodic/${periodic} ${PREFIX}/etc/periodic/daily
.endfor
.for periodic in ${PERIODIC_SECURITY}
	@${INSTALL_SCRIPT} ${WRKSRC}/scripts/periodic/${periodic} ${PREFIX}/etc/periodic/security
.endfor
	@${INSTALL_SCRIPT} ${WRKSRC}/ports/pkg2ng ${PREFIX}/sbin
	@${INSTALL_SCRIPT} ${WRKSRC}/ports/pkg2ng ${PREFIX}/sbin
	@${INSTALL_DATA} ${WRKSRC}/pkg/pkg.conf.sample ${PREFIX}/etc
	@${INSTALL_DATA} ${WRKSRC}/libpkg/pkg.pc ${PREFIX}/libdata/pkgconfig/
	@${MKDIR} ${PREFIX}/share/zsh/site-functions
	@${INSTALL_DATA} ${WRKSRC}/scripts/zsh/_pkg ${PREFIX}/share/zsh/site-functions/
	@${MKDIR} ${PREFIX}/etc/bash_completion.d
	@${INSTALL_DATA} ${WRKSRC}/scripts/bash/_pkg.bash ${PREFIX}/etc/bash_completion.d/
	@${CAT} ${PKGMESSAGE}

.include <bsd.port.post.mk>
