# New ports collection makefile for:	p5-GD-Graph-ohlc
# Date created:		2009-10-02
# Whom:			Steven Kreuzer <skreuzer@FreeBSD.org>
#
# $FreeBSD$
#

PORTNAME=	GD-Graph-ohlc
PORTVERSION=	0.9605
PORTREVISION=	3
CATEGORIES=	graphics perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:JETTERO
PKGNAMEPREFIX=	p5-

MAINTAINER=	skreuzer@FreeBSD.org
COMMENT=	Create charts displaying the open, high, low, and close

BUILD_DEPENDS=	p5-GD-Graph>=0:${PORTSDIR}/graphics/p5-GD-Graph \
		p5-Test-Simple>=0:${PORTSDIR}/devel/p5-Test-Simple
RUN_DEPENDS:=	${BUILD_DEPENDS}

PERL_CONFIGURE=	yes

MAN3=	GD::Graph::candlesticks.3 \
	GD::Graph::ohlc.3

.include <bsd.port.mk>
