# Created by: Cheng-Lung Sung <clsung@FreeBSD.org>
# $FreeBSD$

PORTNAME=	glog
PORTVERSION=	0.3.3
CATEGORIES=	devel
MASTER_SITES=	GOOGLE_CODE

MAINTAINER=	clsung@FreeBSD.org
COMMENT=	A library of C++ classes for flexible logging

LIB_DEPENDS=	execinfo:${PORTSDIR}/devel/libexecinfo \
		gflags:${PORTSDIR}/devel/gflags

GNU_CONFIGURE=	yes
USES=	pathfix
USE_LDCONFIG=	yes
PROJECTHOST=	google-glog

CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib -lexecinfo

.include <bsd.port.pre.mk>

.if ${ARCH} == "amd64" || ${ARCH} =="ia64" || ${ARCH} =="powerpc" || ${ARCH} =="sparc64"
EXTRA_PATCHES=	${FILESDIR}/extra-patch-src-utilities.cc
.endif

.if ${ARCH} == "amd64"
EXTRA_PATCHES+=	${FILESDIR}/extra-patch-src-utilities.h
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|^docdir.*|docdir = ${DOCSDIR}|' ${WRKSRC}/Makefile.in
.if ! ${PORT_OPTIONS:MDOCS}
	@${REINPLACE_CMD} -E -e '/^install-data-am/,/^$$/ s,install-(dist_doc|dist_html|html)DATA,,g' \
	    ${WRKSRC}/Makefile.in
.endif

#regression-test:
#	cd ${WRKSRC}; ${MAKE} check

.include <bsd.port.post.mk>
