# Created by: jrhett@netconsonance.com
# $FreeBSD$

PORTNAME=	cfengine
PORTVERSION=	3.2.3
PORTREVISION=	3
PORTEPOCH=	1
CATEGORIES=	sysutils
MASTER_SITES=	http://cfengine.com/source-code/download?file=
PKGNAMESUFFIX=	32

MAINTAINER=	cy@FreeBSD.org
#		gjb@FreeBSD.org is an alternate committer for this port
COMMENT=	A systems administration tool for networks

LATEST_LINK=	cfengine32
FETCH_BEFORE_ARGS=   -o ${DISTDIR}/${DISTFILES}

CONFLICTS=	cfengine-[2]* cfengine-3.[34]* cfengine-devel-*

USE_RC_SUBR=	cf-execd cf-serverd

LIB_DEPENDS=	pcre.3:${PORTSDIR}/devel/pcre

WITH_BDB_VER?=	47
USE_BDB=	yes
USE_OPENSSL=	yes
GNU_CONFIGURE=	yes
# EXAMPLESDIR=	${PREFIX}/share/examples/cfengine3
DOCSDIR=	${PREFIX}/share/doc/cfengine3
CONFIGURE_ARGS=	--docdir=${DOCSDIR} \
		--htmldir=${DOCSDIR}/html \
		--with-berkeleydb=${LOCALBASE} \
		--with-pcre=${LOCALBASE}

CONFIGURE_ENV+=	BERKELEY_DB_CFLAGS=-I${BDB_INCLUDE_DIR} \
		BERKELEY_DB_LDFLAGS=-L${BDB_LIB_DIR} \
		BERKELEY_DB_LIB=-l${BDB_LIB_NAME}

MAN8=	cf-agent.8	cf-key.8	cf-monitord.8	\
	cf-report.8	cf-serverd.8	cf-execd.8	\
	cf-know.8	cf-promises.8	cf-runagent.8
	

post-patch:
		@${REINPLACE_CMD} -e '/^htmldir/s!=.*!= @htmldir@!'\
				  ${WRKSRC}/docs/Makefile.in

.include <bsd.port.mk>
