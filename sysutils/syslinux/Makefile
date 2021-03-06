# Created by: luigi@FreeBSD.org
# $FreeBSD$

PORTNAME=	syslinux
PORTVERSION=	5.01
CATEGORIES=	sysutils
MASTER_SITES=	KERNEL_ORG/linux/utils/boot/syslinux

MAINTAINER=	ports@FreeBSD.org
COMMENT=	Boot loader for the Linux operating system

BUILD_DEPENDS=	nasm:${PORTSDIR}/devel/nasm
RUN_DEPENDS=	mtools:${PORTSDIR}/emulators/mtools

LICENSE=	GPLv2

USE_XZ=		yes
USE_PERL5_BUILD=	yes
USE_GMAKE=	yes
MAKE_ARGS=	CC="${CC}"
MAKE_JOBS_SAFE=	yes

MAN1=		syslinux.1

.include <bsd.port.pre.mk>

# utility target to build pkg-plist
_A =	mbr/mbr.bin mbr/gptmbr.bin \
	core/pxelinux.0 core/isolinux.bin gpxe/gpxelinux.0 \
	memdisk/memdisk \
	com32/menu/*.c32 com32/modules/*.c32

# convert elf_i386 to elf_i386_fbsd
pre-patch:
	@(cd ${WRKSRC}; 						\
	${FIND} . -type f -exec ${GREP} -le 'elf_i386' \{\} \; | 	\
		${XARGS} ${REINPLACE_CMD} -e 's/elf_i386/elf_i386_fbsd/g;' )

post-patch:
	@${REINPLACE_CMD} -e \
		's|^UMAKEDEPS|#UMAKEDEPS|' ${WRKSRC}/mk/syslinux.mk

build_pkg-plist:
	@( ${ECHO_CMD} "bin/syslinux"	;		\
	  cd ${WRKSRC}; for i in ${_A} ; do	\
		${ECHO_CMD} share/syslinux/`basename $$i` ; done ; \
	  ${ECHO_CMD} "@dirrm share/syslinux" )

do-install:
	${MKDIR} ${DATADIR}
	( cd ${WRKSRC}; ${INSTALL_DATA} ${_A} ${DATADIR} )
	${INSTALL_PROGRAM} ${WRKSRC}/mtools/syslinux ${PREFIX}/bin
	${INSTALL_MAN} ${WRKSRC}/man/syslinux.1 ${MANPREFIX}/man/man1

.include <bsd.port.post.mk>
