# Created by: Sergey Skvortsov <skv@protey.ru>
# $FreeBSD$

PORTNAME=	XML-Sablotron
PORTVERSION=	1.01
CATEGORIES=	textproc perl5
MASTER_SITES=	http://download-1.gingerall.cz/download/sablot/
PKGNAMEPREFIX=	p5-

MAINTAINER=	perl@FreeBSD.org
COMMENT=	Perl interface to the Sablotron XSLT processor

LIB_DEPENDS=	sablot.70:${PORTSDIR}/textproc/sablotron

USES=		iconv
PERL_CONFIGURE=	yes
CONFIGURE_ARGS=	LIBS='-L${LOCALBASE}/lib -lexpat -lsablot -liconv' \
		INC='-I${LOCALBASE}/include' \
		EXPATLIBPATH='${LOCALBASE}/lib' \
		EXPATINCPATH='${LOCALBASE}/include' \
		SABLOTLIBPATH='${LOCALBASE}/lib' \
		SABLOTINCPATH='${LOCALBASE}/include'

MAN3=		XML::Sablotron.3 XML::Sablotron::DOM.3 \
		XML::Sablotron::DOM::DOMHandler.3 XML::Sablotron::SAXBuilder.3 \
		XML::Sablotron::Situation::DOMHandlerDispatcher.3

.include <bsd.port.pre.mk>
.if ${PERL_LEVEL} > 501400
BROKEN=	POLLUTE is gone, does not compile, no release since 2005, textproc/p5-XML-SAXDriver-Sablotron&www/p5-HTML-Webmake depend on me
.endif
.include <bsd.port.post.mk>
