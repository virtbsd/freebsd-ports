# Created by: Andreas Klemm <andreas@klemm.gtn.com>
# $FreeBSD$

PORTNAME=	arts++
PORTVERSION=	1.1.a13
PORTEPOCH=	1
CATEGORIES=	net-mgmt
MASTER_SITES=	http://www.caida.org/tools/utilities/arts/download/

MAINTAINER=	ports@FreeBSD.org
COMMENT=	A network data storage and analysis library from CAIDA

GNU_CONFIGURE=	yes
USE_GMAKE=	yes
CONFIGURE_ARGS=	--enable-shared
USE_LDCONFIG=	yes

MANL=		artsportagg.l artsports.l artsprotos.l artsnets.l artsdump.l \
		artsases.l artstoc.l artsagg.l artsprotoagg.l artsnetagg.l \
		artsasagg.l artsportms.l artsportmagg.l artsintfms.l \
		artsintfmagg.l artsnexthops.l artsnexthopagg.l artstos.l

.include <bsd.port.options.mk>

post-patch:
	@${REINPLACE_CMD} -e 's|echo aout|echo elf|' ${WRKSRC}/ltconfig
	@${REINPLACE_CMD} -e 's/make_pair/std::make_pair/' ${WRKSRC}/classes/include/Ipv4PrefixPatricia.hh.in

post-configure:
	@${REINPLACE_CMD} -E -e "s,( gcc\*),\1 | g++\*,g" ${WRKSRC}/libtool

post-install:
.if ${PORT_OPTIONS:MDOCS}
	@${MKDIR} ${DOCSDIR}/html
.for f in ChangeLog INSTALL WishList
	@${INSTALL_DATA} ${WRKSRC}/${f} ${DOCSDIR}
.endfor
.for f in *.html
	@${INSTALL_DATA} ${WRKSRC}/doc/${f} ${DOCSDIR}/html
.endfor
.endif

.include <bsd.port.mk>
