# New ports collection makefile for:	p5-DateTime-Format-DateManip
# Date created:	   2 july 2003
# Whom:		   Mathieu Arnold <m@absolight.net>
#
# $FreeBSD$
#

PORTNAME=	DateTime-Format-DateManip
PORTVERSION=	0.04
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	perl@FreeBSD.org
COMMENT=	Convert Date::Manip dates and durations to DateTimes and vice versa

BUILD_DEPENDS:=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-DateTime>=0:${PORTSDIR}/devel/p5-DateTime \
		p5-Date-Manip>=0:${PORTSDIR}/devel/p5-Date-Manip

PERL_MODBUILD=	yes

MAN3=		DateTime::Format::DateManip.3

.include <bsd.port.mk>
