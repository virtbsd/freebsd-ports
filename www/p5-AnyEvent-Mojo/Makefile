# New ports collection makefile for:	AnyEvent::Mojo
# Date created:		05 Aug 2010
# Whom:			Jun Kuriyama <kuriyama@FreeBSD.org>
#
# $FreeBSD$
#

PORTNAME=	AnyEvent-Mojo
PORTVERSION=	0.8003
PORTREVISION=	1
CATEGORIES=	www perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	kuriyama@FreeBSD.org
COMMENT=	Perl extension to start async Mojo servers easily

RUN_DEPENDS=	\
	p5-AnyEvent>=5.201:${PORTSDIR}/devel/p5-AnyEvent \
	p5-AnyEvent-HTTP>=1.43:${PORTSDIR}/www/p5-AnyEvent-HTTP \
	p5-Mojolicious>=0.991251:${PORTSDIR}/www/p5-Mojolicious
#	p5-Test-Deep>0:${PORTSDIR}/devel/p5-Test-Deep \
#	p5-Test-Exception>0:${PORTSDIR}/devel/p5-Test-Exception
BUILD_DEPENDS:=	${RUN_DEPENDS}

PERL_CONFIGURE=	yes

MAN3=	AnyEvent::Mojo.3 \
	AnyEvent::Mojo::Server.3 \
	AnyEvent::Mojo::Server::Connection.3

.include <bsd.port.mk>
