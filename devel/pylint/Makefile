# Created by: Hye-Shik Chang
# $FreeBSD$

PORTNAME=	pylint
PORTVERSION=	0.28.0
CATEGORIES=	devel python
MASTER_SITES=	LOGILAB
PKGNAMESUFFIX=	${PYTHON_PKGNAMESUFFIX}

MAINTAINER=	mva@FreeBSD.org
COMMENT=	Analyzes python source code looking for bugs and signs of poor quality

LICENSE=	LGPL21

RUN_DEPENDS=	${PYTHON_SITELIBDIR}/logilab/astng/__init__.py:${PORTSDIR}/devel/py-astng

MAKE_ENV=	NO_SETUPTOOLS=1
USE_PYTHON=	yes
USE_PYDISTUTILS=yes

OPTIONS_DEFINE=	GUI
OPTIONS_DEFAULTS=

.include <bsd.port.options.mk>

post-extract:
	${RM} -fr ${WRKSRC}/test

.if ${PORT_OPTIONS:MGUI}
RUN_DEPENDS+=	${PYTHON_PKGNAMEPREFIX}tkinter>0:${PORTSDIR}/x11-toolkits/py-tkinter
.endif

.include <bsd.port.mk>
