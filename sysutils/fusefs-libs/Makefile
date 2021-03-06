# Created by: Anish Mistry
# $FreeBSD$

PORTNAME=	fusefs
PORTVERSION=	2.9.2
CATEGORIES=	sysutils
MASTER_SITES=	SF/fuse/fuse-2.X/${PORTVERSION}
PKGNAMESUFFIX=	-libs
DISTNAME=	fuse-${PORTVERSION}

MAINTAINER=	ports@FreeBSD.org
COMMENT=	FUSE allows filesystem implementation in userspace

GNU_CONFIGURE=	yes
CONFIGURE_ENV=	MOUNT_FUSE_PATH=${PREFIX}/sbin
USE_LDCONFIG=	yes
USES=		pkgconfig iconv
CONFIGURE_ARGS=	--prefix=${PREFIX} \
		--with-pkgconfigdir=${PREFIX}/libdata/pkgconfig
TXT_DOCS=	how-fuse-works \
		kernel.txt

post-install:
	${INSTALL_DATA} ${WRKSRC}/include/fuse_kernel.h ${PREFIX}/include/fuse

.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}/libs
.for i in ${TXT_DOCS}
	@${INSTALL_DATA} ${WRKSRC}/doc/$i ${DOCSDIR}/libs
.endfor
.endif

MAN1=	fusermount.1 \
	ulockmgr_server.1
MAN8=	mount.fuse.8

.include <bsd.port.mk>
