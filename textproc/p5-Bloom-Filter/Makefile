# Created by: Aaron Straup Cope <ascope@cpan.org>
# $FreeBSD$

PORTNAME=	Bloom-Filter
PORTVERSION=	1.0
CATEGORIES=	textproc perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:MCEGLOWS
PKGNAMEPREFIX=	p5-

MAINTAINER=	perl@FreeBSD.org
COMMENT=	Probabilistic algorithm for doing existence tests

BUILD_DEPENDS=	p5-Digest-SHA1>=0:${PORTSDIR}/security/p5-Digest-SHA1
RUN_DEPENDS:=	${BUILD_DEPENDS}

PERL_CONFIGURE=	yes

MAN3=		Bloom::Filter.3

.include <bsd.port.mk>
