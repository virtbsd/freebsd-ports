# New ports collection makefile for:	p5-Term-Animation
# Date created:				Sep 16, 2005
# Whom:					Max Khon <fjoe@FreeBSD.org>
#
# $FreeBSD$
#

PORTNAME=	Term-Animation
PORTVERSION=	2.6
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	fjoe@FreeBSD.org
COMMENT=	ASCII sprite animation framework

BUILD_DEPENDS=	p5-Curses>=0:${PORTSDIR}/devel/p5-Curses
RUN_DEPENDS:=	${BUILD_DEPENDS}

PERL_CONFIGURE=	yes

MAN3=		Term::Animation.3 Term::Animation::Entity.3

.include <bsd.port.mk>
