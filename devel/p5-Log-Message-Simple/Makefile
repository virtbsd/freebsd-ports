# Created by: Aaron Dalton <aaron@FreeBSD.org>
# $FreeBSD$
#

PORTNAME=	Log-Message-Simple
PORTVERSION=	0.10
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	perl@FreeBSD.org
COMMENT=	Provides standardized logging facilities using the Log::Message module

BUILD_DEPENDS=	p5-Log-Message>=0:${PORTSDIR}/devel/p5-Log-Message
RUN_DEPENDS:=	${BUILD_DEPENDS}

MAN3=	Log::Message::Simple.3

PERL_CONFIGURE=	yes

.include <bsd.port.mk>
