# Created by: Emanuel Haupt <ehaupt@FreeBSD.org>
# $FreeBSD$

PORTNAME=	JE
PORTVERSION=	0.060
CATEGORIES=	www perl5
MASTER_SITES=	CPAN
MASTER_SITE_SUBDIR=	CPAN:SPROUT
PKGNAMEPREFIX=	p5-

MAINTAINER=	ehaupt@FreeBSD.org
COMMENT=	Pure-Perl ECMAScript (JavaScript) Engine

RUN_DEPENDS=	p5-TimeDate>0:${PORTSDIR}/devel/p5-TimeDate \
		p5-Tie-RefHash-Weak>0:${PORTSDIR}/devel/p5-Tie-RefHash-Weak
BUILD_DEPENDS:=	${RUN_DEPENDS}

PERL_CONFIGURE=	yes
MAKE_JOBS_SAFE=	yes

MAN3=		JE::Object.3 JE::_FieldHash.3 JE::String.3 \
		JE::Object::Boolean.3 JE::Object::Number.3 \
		JE::Parser.3 JE::LValue.3 JE::Object::Date.3 \
		JE::Code.3 JE::Object::Error.3 JavaScript::Engine.3 \
		JE::Object::Error::URIError.3 JE::Number.3 \
		JE::Object::Error::RangeError.3 JE::Boolean.3 \
		JE::Object::Error::TypeError.3 \
		JE::Object::Error::SyntaxError.3 JE::Null.3 \
		JE::Object::Math.3 JE::Scope.3 JE::Undefined.3 \
		JE::Object::Error::ReferenceError.3 \
		JE::Object::RegExp.3 JE::Object::String.3 JE::Object::Proxy.3 \
		JE::Types.3 JE::Object::Array.3 JE::Object::Function.3 JE.3 \
		JE::Destroyer.3

# Wrong versioning upstream
PORTSCOUT=	skipv:0.54

.include <bsd.port.mk>
