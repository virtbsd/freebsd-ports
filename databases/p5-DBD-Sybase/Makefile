# Created by: Sheldon Hearn <sheldonh@FreeBSD.org>
# $FreeBSD$

PORTNAME=	DBD-Sybase
PORTVERSION=	1.14
CATEGORIES=	databases perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	perl@FreeBSD.org
COMMENT=	Sybase DBI driver for Perl 5

BUILD_DEPENDS=	p5-DBI>=0:${PORTSDIR}/databases/p5-DBI
LIB_DEPENDS=	ct.4:${PORTSDIR}/databases/freetds
RUN_DEPENDS=	p5-DBI>=0:${PORTSDIR}/databases/p5-DBI

CONFIGURE_ENV=	SYBASE=${LOCALBASE}
PERL_CONFIGURE=	yes
USES=		gettext

.if defined(BATCH)
CONFIGURE_ARGS=	< /dev/null
.endif

MAN3=		DBD::Sybase.3

.include <bsd.port.mk>
