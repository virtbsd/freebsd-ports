# Created by: jkoshy
# $FreeBSD$

PORTNAME=	smlnj
PORTVERSION=	110.71
CATEGORIES=	lang
MASTER_SITES=	http://smlnj.cs.uchicago.edu/dist/working/${PORTVERSION}/ \
		ftp://mirror.free.de/http/smlnj.cs.uchicago.edu/dist/working/${PORTVERSION}/
PKGNAMESUFFIX=	-devel
DISTFILES=	config.tgz runtime.tgz
DIST_SUBDIR=	sml-nj/${PORTVERSION}
EXTRACT_ONLY=	config.tgz

MAINTAINER=	joemann@beefree.free.de
COMMENT=	A popular functional language from Bell Labs

NO_WRKSUBDIR=	yes
USE_GMAKE=	yes

ONLY_FOR_ARCHS=	i386

OPTIONS_DEFINE=	EVERYTHING RECOMPILE POSITION64
EVERYTHING_DESC=	install everything from the SML/NJ distribution
RECOMPILE_DESC=		recompile the SML compiler - implies EVERYTHING
POSITION64_DESC=	use 64bit fi""le positions - implies RECOMPILE

SUB_FILES=	pkg-install
SUB_LIST=	EXEBINDIR=${MLBINRELATIVE} EXENAMES="${MLEXE}"
PKGDEINSTALL=	${PKGINSTALL}

.include <bsd.port.pre.mk>

.if (${ARCH} == "i386")
MLARCH=		x86
DISTFILES+=	boot.x86-unix.tgz
#.elif (${ARCH} == "alpha")
#MLARCH=		alpha32
#DISTFILES+=	boot.alpha32-unix.tgz
.endif
DISTFILES+=	MLRISC.tgz ckit.tgz cml.tgz heap2asm.tgz ml-lpt.tgz \
		ml-lex.tgz ml-yacc.tgz smlnj-lib.tgz trace-debug-profile.tgz

PLIST_SUB=	MLARCH=${MLARCH}

.if ${PORT_OPTIONS:MPOSITION64}
WITH_RECOMPILE?=	${WITH_POSITION64}
CMB_COMMAND=	'(\#set o CMB.symval) "USE_64_BIT_POSITIONS" (SOME 1);'
.else
CMB_COMMAND=
.endif

.if ${PORT_OPTIONS:MRECOMPILE}
WITH_EVERYTHING?=	${WITH_RECOMPILE}
.endif

.if ${PORT_OPTIONS:MEVERYTHING}
DISTFILES+=	cm.tgz compiler.tgz eXene.tgz ml-burg.tgz \
		nlffi.tgz pgraph.tgz smlnj-c.tgz system.tgz
.endif

MLROOTRELATIVE=	smlnj
MLROOT=		${PREFIX}/${MLROOTRELATIVE}
MLBINRELATIVE=	${MLROOTRELATIVE}/bin
MLBIN=		${MLROOT}/bin
MLLIB=		${MLROOT}/lib
MLSTDSRCDIRS=	cml heap2asm ml-lex ml-lpt ml-yacc smlnj-lib
MLSRCDIRS=	base ${MLSTDSRCDIRS} \
		ckit eXene ml-burg nlffi pgraph smlnj-c
MLSRCS=
.for srcdir in ${MLSRCDIRS}
MLSRCS+=	${MLROOT}/${srcdir}
.endfor
MLTARGETS=	heap2asm
MLEXE=		heap2exec ml-antlr ml-build ml-lex ml-makedepend \
		ml-ulex ml-yacc sml
.if ${PORT_OPTIONS:MEVERYTHING}
MLTARGETS+=	eXene ml-burg ml-nlffi-lib ml-nlffigen \
		mlrisc-tools nowhere pgraph-util src-smlnj
MLEXE+=		ml-burg ml-nlffigen nowhere
PLIST=		${WRKDIR}/.PLIST
MLRUNTIMEPLIST=	${WRKDIR}/.PLIST-runtime
MLSRCPLIST=	${WRKDIR}/.PLIST-src
MLPLISTFILES=	${.CURDIR}/pkg-plist ${FILESDIR}/plist-everything \
		${MLRUNTIMEPLIST} ${MLSRCPLIST}
.endif

pre-fetch:
	@${ECHO}
.if ! ${PORT_OPTIONS:MEVERYTHING}
	@${ECHO} 'Use make WITH_EVERYTHING=yes to also build/install'
	@${ECHO} ' eXene (X Windows toolkit),'
	@${ECHO} ' ml-burg (tree transformer),'
	@${ECHO} ' ml-nlffi (foreign function interface to C code),'
	@${ECHO} ' nowhere (preprocessor for conditional patterns),'
	@${ECHO} ' various libraries, and all the sources.'
.endif
.if ! ${PORT_OPTIONS:MRECOMPILE}
	@${ECHO} 'Use make WITH_RECOMPILE=yes to recompile the compiler.'
	@${ECHO} ' This implies WITH_EVERYTHING.'
.endif
.if ! ${PORT_OPTIONS:MPOSITION64}
	@${ECHO} 'Use make WITH_POSITION64=yes to use 64bit file positions.'
	@${ECHO} ' This implies WITH_RECOMPILE.'
.endif
	@${ECHO}

# make symlinks to the dist files

post-extract:
	cd ${WRKDIR} && ${LN} -sf ${_DISTDIR}/* .

# Configuring is done by uncommenting the appropriate #request xxx
# lines of config/targets. Dependency details are handled by
# base/system/smlnj/installer using config/dependencies and
# config/actions.

do-configure:
.if defined(MLTARGETS)
	${ECHO_CMD} -n > "${WRKDIR}/.tmp.sed"
.for t in ${MLTARGETS}
	${ECHO_CMD} '/^#request[ 	]+${t}$$/s/^#//' >> "${WRKDIR}/.tmp.sed"
.endfor
	${SED} -i .default -E -f "${WRKDIR}/.tmp.sed" "${WRKDIR}/config/targets"
.endif
# Recompilation requires ml-lex and ml-yacc. All requested targets
# will be built later using the recompiled core system after
# removing targets.customized. See "do-build" below.
.if ${PORT_OPTIONS:MRECOMPILE}
	( ${ECHO_CMD} "request	ml-yacc" && \
	  ${ECHO_CMD} "request	ml-lex" && \
	  ${ECHO_CMD} "request	ml-lex-mllex-tool" && \
	  ${ECHO_CMD} "request	src-smlnj" ) \
	> "${WRKDIR}/config/targets.customized"
.endif

# The build target patches, builds, and installs the system within WRKDIR.
# base/runtime is not cleaned afterwards to avoid its recompilation during
# a subsequent make install.
# See base/system/README for information on recompiling the compiler.

.if ${PORT_OPTIONS:MRECOMPILE}
RECOMPILEDIR=	base/system
.else
RECOMPILEDIR=
.endif

MLRUNTIMEPATCHES_CMD=	cd ${FILESDIR} && \
			( ${LS} do-patch-base_runtime_* 2>&- || \
			  ${TRUE} )
MLSTANDARDPATCHES_CMD=	cd ${FILESDIR} && \
			( for srcdir in ${MLSTDSRCDIRS} ; \
			  do ${LS} do-patch-$${srcdir}_* 2>&- ; \
			  done ) || ${TRUE}
MLSTANDARDPATCHDIRS_CMD=	cd ${FILESDIR} && \
			( for srcdir in ${MLSTDSRCDIRS} ; \
			  do if ${LS} do-patch-$${srcdir}_* 1>&- 2>&- ; \
			     then ${ECHO_CMD} -n $${srcdir} " " ; break ; fi ; \
			  done ) || ${TRUE}
.if ${PORT_OPTIONS:MEVERYTHING}
MLSOURCEPATCHES_CMD=	cd ${FILESDIR} && \
			( ${LS} do-patch-* 2>&- || \
			  ${TRUE} )
.else
MLSOURCEPATCHES_CMD=	${TRUE}
.endif

do-build:
	cd ${WRKDIR} && unset PWD && \
	FILESDIR="${FILESDIR}" PATCH="${PATCH}" PATCH_ARGS="${PATCH_ARGS}" \
	MLNORUNTIMECLEAN=yes \
	MLRUNTIMEPATCHES=`${MLRUNTIMEPATCHES_CMD}` \
	MLSTANDARDPATCHES=`${MLSTANDARDPATCHES_CMD}` \
	MLSTANDARDPATCHDIRS=`${MLSTANDARDPATCHDIRS_CMD}` \
	MLSOURCEPATCHES=`${MLSOURCEPATCHES_CMD}` \
	./config/install.sh
.if ${PORT_OPTIONS:MRECOMPILE}
	-${RM} ${WRKDIR}/config/targets.customized
	@${ECHO} '(* Recompiling the core system: *)'
	cd ${WRKDIR}/${RECOMPILEDIR} && ( \
	${ECHO_CMD} 'CM.autoload "$$smlnj/cmb.cm";' ; \
	${ECHO_CMD} ${CMB_COMMAND} ; \
	${ECHO_CMD} 'CMB.make ();' ) | \
	../../bin/sml
	@${ECHO} '(* Building the recompiled heap: *)'
	cd ${WRKDIR}/${RECOMPILEDIR} && \
	./makeml
	@${ECHO} '(* Removing old libs and heaps: *)'
	cd ${WRKDIR}/${RECOMPILEDIR} && \
	${RM} -rf ../../lib && ${MKDIR} ../../lib && \
	${FIND} ../../bin/.heap -name '*.${MLARCH}-bsd' \
	\! -name 'sml.${MLARCH}-bsd' -delete -print
	@${ECHO} '(* Installing the recompiled libs and heap: *)'
	cd ${WRKDIR}/${RECOMPILEDIR} && \
	./installml
	@${ECHO} '(* Building requested targets: *)'
	cd ${WRKDIR} && unset PWD && \
	FILESDIR="${FILESDIR}" PATCH="${PATCH}" PATCH_ARGS="${PATCH_ARGS}" \
	MLNORUNTIMECLEAN=yes RECOMPILEDIR="${RECOMPILEDIR}" \
	./config/install.sh
.endif

# Nowadays PLIST has to be computed before installation. We do it in
# "pre-install" because source extraction happens during "build".

.if ${PORT_OPTIONS:MEVERYTHING}
MLNOINSTALL=	.cm
.if ${PORT_OPTIONS:MRECOMPILE}
MLNOINSTALL+=	sml.bin.${MLARCH}-unix sml.boot.${MLARCH}-unix \
		sml.lib sml.${MLARCH}-bsd
.endif
MLSRCEXCLUDEREGEX=	-e '^(@dirrm\ )?${MLROOTRELATIVE}/base/runtime'
.for excl in ${MLNOINSTALL}
MLSRCEXCLUDEREGEX+=	-e '/${excl}$$' -e '/${excl}/'
.endfor
MLPATCHPATHREGEX=	-E -e 's%(^|[^_])_([^_]|$$)%\1/\2%g' \
			   -e 's%(^|[^_])__([^_]|$$)%\1_\2%g' \
			   -e 's%(^|[^_])___([^_]|$$)%\1/_\2%g'

pre-install:
	@${ECHO} -n '(* Computing package list ...'
	@${TAR} -tzf ${WRKDIR}/runtime.tgz | \
	${SED} -E -e 's%^(.*[^/])$$%${MLROOTRELATIVE}/base/\1%' \
		-e 's%^(.*)/$$%@dirrm\ ${MLROOTRELATIVE}/base/\1%' \
		> ${MLRUNTIMEPLIST}
	`${MLRUNTIMEPATCHES_CMD}` | \
	${SED} ${MLPATCHPATHREGEX} | \
	${SED} -E -e 's%^do-patch-(base/.*)%${MLROOTRELATIVE}/\1.orig%' \
	>> ${MLRUNTIMEPLIST}
	@cd "${WRKDIR}" && ( \
	( ${FIND} -s -d ${MLSRCDIRS} \! -type d | \
	${AWK} '{ print "${MLROOTRELATIVE}/" $$0 }' ) ; \
	( ${FIND} -s -d ${MLSRCDIRS} -type d -empty | \
	${AWK} '{ print "@exec mk""dir -p %D/${MLROOTRELATIVE}/" $$0 }' ) ; \
	( ${FIND} -s -d ${MLSRCDIRS} -type d | \
	${AWK} '{ print "@dirrm ${MLROOTRELATIVE}/" $$0 }' ) ) | \
	${EGREP} -v ${MLSRCEXCLUDEREGEX} > ${MLSRCPLIST}
	@${GREP} -h "^[^@]" ${MLPLISTFILES} | ${SORT} -u > ${PLIST}
	@${GREP} -h "^@exec mk""dir" ${MLPLISTFILES} | ${SORT} -u >> ${PLIST}
	@${GREP} -h "^@dirrm" ${MLPLISTFILES} | ${SORT} -r -u >> ${PLIST}
	@${ECHO} ' done. *)'
.endif

# The install target installs the heaps and libraries to their final
# location in ${MLBIN} and ${MLLIB}.
# In case of recompilation, installml installs the sml heap and the
# libraries built during compiler bootstrap to ${MLBIN} and ${MLLIB}.

.if ${PORT_OPTIONS:MEVERYTHING}
MLSRCEXCLUDES=
.for excl in ${MLNOINSTALL}
MLSRCEXCLUDES+=	--exclude "${excl}"
.endfor
.endif

do-install:
	${MKDIR} "${MLROOT}"
.if ! ${PORT_OPTIONS:MRECOMPILE}
	cd ${WRKDIR} && unset PWD && \
	FILESDIR="${FILESDIR}" PATCH="${PATCH}" PATCH_ARGS="${PATCH_ARGS}" \
	INSTALLDIR="${MLROOT}" ./config/install.sh
.else
	@${ECHO} '(* Rebuilding the recompiled libs: *)'
	cd ${WRKDIR}/${RECOMPILEDIR} && ( \
	${ECHO_CMD} 'CM.autoload "$$smlnj/cmb.cm";' ; \
	${ECHO_CMD} ${CMB_COMMAND} ; \
	${ECHO_CMD} 'CMB.make ();' ) | \
	../../bin/sml
	@${ECHO} '(* Rebuilding the recompiled heap: *)'
	cd ${WRKDIR}/${RECOMPILEDIR} && \
	./makeml
	@${ECHO} '(* Installing into ${MLROOT}: *)'
	cd ${WRKDIR} && unset PWD && \
	FILESDIR="${FILESDIR}" PATCH="${PATCH}" PATCH_ARGS="${PATCH_ARGS}" \
	INSTALLDIR="${MLROOT}" RECOMPILEDIR="${RECOMPILEDIR}" \
	./config/install.sh
.endif
	MLARCHOPSYS=`${MLBIN}/.arch-n-opsys` && \
	( eval $${MLARCHOPSYS} ; \
	${STRIP_CMD} "${MLBIN}/.run/run.$${ARCH}-$${OPSYS}" )
	@${CHOWN} -R ${BINOWN}:${BINGRP} "${MLBIN}" "${MLLIB}"
.if ${PORT_OPTIONS:MEVERYTHING}
	@${ECHO} '(* Cleaning base/runtime: *)'
	cd ${WRKDIR}/base/runtime/objs && ${GMAKE} clean
	@${ECHO} -n '(* Installing sources into ${MLROOT} ...'
	@cd ${WRKDIR} && ${TAR} -cf - ${MLSRCEXCLUDES} ${MLSRCDIRS} | \
	${TAR} -xf - -C "${MLROOT}"
	@${CHOWN} -R ${SHAREOWN}:${SHAREGRP} ${MLSRCS}
	@${ECHO} ' done. *)'
.endif

post-install:
	PKG_PREFIX=${PREFIX} MULTIEXEC_WRAPPER_VERBOSE=yes \
	${SH} ${PKGINSTALL} ${PKGNAME} POST-INSTALL

.ifndef MULTIEXEC_WRAPPER_VERBOSE
deinstall:
	export MULTIEXEC_WRAPPER_VERBOSE=yes && \
	cd ${.CURDIR} && ${MAKE} ${.MAKEFLAGS} deinstall
.endif

# This target may be used by dependent ports to set SMLNJ_DEVEL_VERSION
# either to the currently installed sml-nj-devel package's version
# or else to this port's version. SMLNJ_DEVEL_VERSION is an environment
# variable used by multiexec-wrapper to select the executable
# from that smlnj-devel-* package matching SMLNJ_DEVEL_VERSION.
smlnj-devel-version:
	@${EXPR} `${PKG_INFO} -q -O lang/sml-nj-devel` : '.*-\(.*\)' \
		2>/dev/null || \
	${ECHO_CMD} ${PKGVERSION}

.include <bsd.port.post.mk>
