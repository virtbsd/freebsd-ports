# Created by: Zhihao Yuan <lichray@gmail.com>
# $FreeBSD$
#

PORTNAME=	falcon
PORTVERSION=	0.1.4
CATEGORIES=	www python
MASTER_SITES=	CHEESESHOP
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	lichray@gmail.com
COMMENT=	High-performance Python framework for building cloud APIs

LICENSE=	AL2

BUILD_DEPENDS=	cython>=0.11.2:${PORTSDIR}/lang/cython
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}testtools>=0:${PORTSDIR}/devel/py-testtools \
		${PYTHON_PKGNAMEPREFIX}six>=1.1.0:${PORTSDIR}/devel/py-six

USE_PYTHON=	2.7+
USE_PYDISTUTILS=	easy_install
PYEASYINSTALL_ARCHDEP=	yes

.include <bsd.port.mk>
