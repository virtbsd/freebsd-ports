# New ports collection makefile for:    p5-Devel-StealthDebug
# Date created:				August 18th 2004
# Whom:	      				Alex Kapranoff <alex@kapranoff.ru>
#
# $FreeBSD$
#

PORTNAME=	Devel-StealthDebug
PORTVERSION=	1.008
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	ports@FreeBSD.org
COMMENT=	Simple non-intrusive debug module

BUILD_DEPENDS=	p5-Filter-Simple>=0:${PORTSDIR}/textproc/p5-Filter-Simple
RUN_DEPENDS:=	${BUILD_DEPENDS}

PERL_CONFIGURE=	yes
INSTALL_TARGET=	pure_install

MAN3=		Devel::StealthDebug.3

.include <bsd.port.mk>
