# New ports collection makefile for:	KMyMoney
# Date created:				21 June 2004
# Whom:					Alexander Novitsky
#
# $FreeBSD$
#

PORTNAME=	kmymoney2
PORTVERSION=	1.0.5
PORTREVISION=	3
CATEGORIES=	finance
MASTER_SITES=	SF/${PORTNAME}/KMyMoney/${PORTVERSION}

MAINTAINER=	ports@FreeBSD.org
COMMENT=	KDE-based personal finance assistant

BUILD_DEPENDS=	bash:${PORTSDIR}/shells/bash \

LIB_DEPENDS=	osp.5:${PORTSDIR}/textproc/opensp \
		ofx.5:${PORTSDIR}/finance/libofx

DEPRECATED=	Depends on QT3; unmaintained
EXPIRATION_DATE=	2013-07-01

USE_KDELIBS_VER=3
USE_GMAKE=	yes
GNU_CONFIGURE=	yes
USE_AUTOTOOLS=	libtool
USE_PERL5=	yes
USE_BZIP2=	yes
USE_LDCONFIG=	yes
USES=		gettext
USE_XORG=	xext

INSTALLS_ICONS=	yes

MAN1=		kmymoney2.1
MANCOMPRESSED=	yes

DATADIR=	${PREFIX}/share/apps/${PORTNAME}
DOCSDIR=	${PREFIX}/share/doc/HTML/en/${PORTNAME}

.include <bsd.port.pre.mk>

.if ${ARCH} == "powerpc"
BROKEN=		Does not compile on powerpc
.endif

.if !defined(NOPORTDOCS)
CONFIGURE_ARGS=	--enable-ofxplugin --enable-ofxbanking --enable-pdf-docs

# Add more build-time dependencies to generate the PDF docs
BUILD_DEPENDS+=	jade:${PORTSDIR}/textproc/jade \
		pdfjadetex:${PORTSDIR}/print/jadetex \
		html2ps:${PORTSDIR}/print/html2ps \
		dsssl-docbook-modular>=0:${PORTSDIR}/textproc/dsssl-docbook-modular \
		cppunit-config:${PORTSDIR}/devel/cppunit \
		recode:${PORTSDIR}/converters/recode
.else
CONFIGURE_ARGS=	--enable-ofxplugin --enable-ofxbanking
EXTRA_PATCHES=	${FILESDIR}/extra-patch-Makefile.in \
		${FILESDIR}/extra-patch-doc__en__Makefile.in
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|%%LIBTOOL%%|${LIBTOOL}|g ; \
		s|%%LTMAIN%%|${LTMAIN}|g' ${WRKSRC}/configure

.include <bsd.port.post.mk>
