# New ports collection makefile for:	p5-File-Lock
# Date created:				October 17th 1996
# Whom:	      				James FitzGibbon <jfitz@FreeBSD.org>
#
# $FreeBSD$
#

PORTNAME=	File-Lock
PORTVERSION=	0.9
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	demon@FreeBSD.org
COMMENT=	Perl5 module for file locking (flock,fcntl)

PERL_CONFIGURE=	yes
CONFIGURE_ARGS+=	POLLUTE=1

.include <bsd.port.pre.mk>
.if ${PERL_LEVEL} > 501400
BROKEN=	does not compile POLLUTE is gone, no release since 1996, net/netdisco depends on me
.endif
.include <bsd.port.post.mk>
