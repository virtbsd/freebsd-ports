# Created by: Dmitry Marakasov <amdmi3@FreeBSD.org>
# $FreeBSD$

PORTNAME=	PerlIO-via-Unidecode
PORTVERSION=	1.01
CATEGORIES=	converters perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	amdmi3@FreeBSD.org
COMMENT=	A perlio layer for Unidecode

BUILD_DEPENDS=	p5-Text-Unidecode>=0:${PORTSDIR}/converters/p5-Text-Unidecode
RUN_DEPENDS=	p5-Text-Unidecode>=0:${PORTSDIR}/converters/p5-Text-Unidecode

PERL_CONFIGURE=	yes

MAN3=		PerlIO::via::Unidecode.3

.include <bsd.port.mk>
