# New ports collection makefile for:	finance/p5-Data-Currency
# Date created:				01 November 2007
# Whom:					Zach Thompson <hideo@lastamericanempire.com>
#
# $FreeBSD$
#

PORTNAME=	Data-Currency
PORTVERSION=	0.04002
PORTREVISION=	1
CATEGORIES=	finance perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	Data
PKGNAMEPREFIX=	p5-

MAINTAINER=	perl@FreeBSD.org
COMMENT=	Container class for currency conversion/formatting

BUILD_DEPENDS=	p5-Locale-Currency-Format>=0:${PORTSDIR}/finance/p5-Locale-Currency-Format \
		p5-Class-Accessor-Grouped>=0:${PORTSDIR}/devel/p5-Class-Accessor-Grouped \
		p5-Finance-Currency-Convert-WebserviceX>=0:${PORTSDIR}/finance/p5-Finance-Currency-Convert-WebserviceX \
		p5-Locale-Codes>=0:${PORTSDIR}/misc/p5-Locale-Codes \
		p5-Class-Inspector>=0:${PORTSDIR}/devel/p5-Class-Inspector
RUN_DEPENDS=	p5-Locale-Currency-Format>=0:${PORTSDIR}/finance/p5-Locale-Currency-Format \
		p5-Class-Accessor-Grouped>=0:${PORTSDIR}/devel/p5-Class-Accessor-Grouped \
		p5-Finance-Currency-Convert-WebserviceX>=0:${PORTSDIR}/finance/p5-Finance-Currency-Convert-WebserviceX \
		p5-Locale-Codes>=0:${PORTSDIR}/misc/p5-Locale-Codes \
		p5-Class-Inspector>=0:${PORTSDIR}/devel/p5-Class-Inspector

PERL_CONFIGURE=	yes

MAN3=	Data::Currency.3

.include <bsd.port.mk>
