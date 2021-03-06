# $FreeBSD$

PORTNAME=	xbmc
DISTVERSION=	12.0
PORTREVISION=	1
CATEGORIES=	multimedia
MASTER_SITES=	http://mirrors.xbmc.org/releases/source/

MAINTAINER=	mickael.maillot@gmail.com
COMMENT=	Award winning media center application

LICENSE=	GPLv2

BUILD_DEPENDS=	enca:${PORTSDIR}/converters/enca \
		gawk:${PORTSDIR}/lang/gawk \
		gperf:${PORTSDIR}/devel/gperf \
		cmake:${PORTSDIR}/devel/cmake \
		zip:${PORTSDIR}/archivers/zip \
		unzip:${PORTSDIR}/archivers/unzip \
		nasm:${PORTSDIR}/devel/nasm \
		dvdread-config:${PORTSDIR}/multimedia/libdvdread \
		gtk-update-icon-cache:${PORTSDIR}/x11-toolkits/gtk20 \
		swig2.0:${PORTSDIR}/devel/swig20
LIB_DEPENDS=	ass:${PORTSDIR}/multimedia/libass \
		boost_thread:${PORTSDIR}/devel/boost-libs \
		cdio:${PORTSDIR}/sysutils/libcdio	\
		curl:${PORTSDIR}/ftp/curl \
		dbus-1:${PORTSDIR}/devel/dbus \
		enca:${PORTSDIR}/converters/enca \
		GLEW:${PORTSDIR}/graphics/glew \
		FLAC:${PORTSDIR}/audio/flac \
		fontconfig:${PORTSDIR}/x11-fonts/fontconfig \
		freetype:${PORTSDIR}/print/freetype2 \
		fribidi:${PORTSDIR}/converters/fribidi \
		lzo2:${PORTSDIR}/archivers/lzo2 \
		jasper:${PORTSDIR}/graphics/jasper \
		jpeg:${PORTSDIR}/graphics/jpeg \
		mad:${PORTSDIR}/audio/libmad \
		modplug:${PORTSDIR}/audio/libmodplug \
		mpeg2:${PORTSDIR}/multimedia/libmpeg2 \
		pcre:${PORTSDIR}/devel/pcre \
		png15:${PORTSDIR}/graphics/png \
		samplerate:${PORTSDIR}/audio/libsamplerate \
		sqlite3:${PORTSDIR}/databases/sqlite3 \
		tag:${PORTSDIR}/audio/taglib \
		tinyxml:${PORTSDIR}/textproc/tinyxml \
		vorbis:${PORTSDIR}/audio/libvorbis \
		yajl:${PORTSDIR}/devel/yajl
RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}sqlite3>0:${PORTSDIR}/databases/py-sqlite3 \
		glxinfo:${PORTSDIR}/graphics/mesa-demos \
		nmblookup:${PORTSDIR}/net/samba-nmblookup \
		${PYTHON_PKGNAMEPREFIX}imaging>0:${PORTSDIR}/graphics/py-imaging \
		xdpyinfo:${PORTSDIR}/x11/xdpyinfo

FETCH_ARGS=	-Fpr
USES=		pkgconfig
USE_GMAKE=	yes
USE_AUTOTOOLS=	autoconf libtool automake libltdl
GNU_CONFIGURE=	yes
USE_XORG=	xt xmu xrandr xtst
USE_GL=		glu
USE_SDL=	image sdl
USE_PYTHON=	-2.7
USE_JAVA=	yes
JAVA_BUILD=	jre
MAKE_JOBS_SAFE=	yes
NOPRECIOUSMAKEVARS=	yes
INSTALLS_ICONS=	yes
ONLY_FOR_ARCHS=	i386 amd64
CONFLICTS_INSTALL=	xbmc-pva-ppa-odk-[0-9]*

DESKTOP_ENTRIES="XBMC" \
		"${COMMENT}" \
		"${DATADIR}/media/icon.png" \
		"xbmc" \
		"AudioVideo;Video;" \
		true

OPTIONS_DEFINE=	AIRPLAY AIRTUNES AVAHI CEC EXTERNAL_FFMPEG LAME \
		LIBBLURAY HAL LIRC MYSQL NONFREE PULSEAUDIO RTMP SFTP \
		SMB VAAPI VDPAU VORBIS WEBSERVER
AIRPLAY_DESC=	AirPlay support via libplist
AIRTUNES_DESC=	AirTunes support via libshairport
CEC_DESC=	CEC adapter support
EXTERNAL_FFMPEG_DESC=	Use external ffmpeg
NONFREE_DESC=	Enable non-free components (rar, ccx, ffmpeg)
SFTP_DESC=	SSH SFTP support via libssh
VORBIS_DESC=	Ogg Vorbis audio encoder

OPTIONS_DEFAULT=	AIRPLAY AVAHI CEC LAME LIBBLURAY HAL MYSQL \
			RTMP SFTP SMB VORBIS WEBSERVER

CONFIGURE_ARGS+=	--disable-nfs

MAN1=	xbmc.bin.1
MLINKS=	xbmc.bin.1 xbmc.1

.include <bsd.port.options.mk>

.if ${ARCH} == i386
PLIST_SUB+=	ARCH="x86"
.else
PLIST_SUB+=	ARCH="x86_64"
.endif

.if ${OSVERSION} <= 800096
LIB_DEPENDS+=	asound:${PORTSDIR}/audio/alsa-lib
RUN_DEPENDS+=	${LOCALBASE}/lib/alsa-lib/libasound_module_pcm_oss.so:${PORTSDIR}/audio/alsa-plugins
USE_SDL+=	mixer
CONFIGURE_ARGS+=	--disable-oss
.else
CONFIGURE_ARGS+=	--disable-alsa
.endif

.if ${PORT_OPTIONS:MDEBUG}
CONFIGURE_ARGS+=	--enable-debug
.else
CONFIGURE_ARGS+=	--disable-debug
.endif

.if ${PORT_OPTIONS:MAIRPLAY}
CONFIGURE_ARGS+=	--enable-airplay
LIB_DEPENDS+=	plist:${PORTSDIR}/devel/libplist
.else
CONFIGURE_ARGS+=	--disable-airplay
.endif

.if ${PORT_OPTIONS:MAIRTUNES}
CONFIGURE_ARGS+=	--enable-airtunes
LIB_DEPENDS+=	shairport:${PORTSDIR}/audio/libshairport
.else
CONFIGURE_ARGS+=	--disable-airtunes
.endif

.if ${PORT_OPTIONS:MAVAHI}
CONFIGURE_ARGS+=	--enable-avahi
LIB_DEPENDS+=	avahi-common:${PORTSDIR}/net/avahi-app
.else
CONFIGURE_ARGS+=	--disable-avahi
.endif

.if ${PORT_OPTIONS:MCEC}
CONFIGURE_ARGS+=	--enable-libcec
LIB_DEPENDS+=	cec:${PORTSDIR}/multimedia/libcec
.else
CONFIGURE_ARGS+=	--disable-libcec
.endif

.if ${PORT_OPTIONS:MEXTERNAL_FFMPEG}
CONFIGURE_ARGS+=	--enable-external-ffmpeg
FFMPEG_SUFFIX=	1
CONFIGURE_ENV+=	FFMPEG_SUFFIX="${FFMPEG_SUFFIX}"
PLIST_SUB+=	EXTERNAL_FFMPEG="@comment "
BUILD_DEPENDS+=	ffmpeg${FFMPEG_SUFFIX}>0.11:${PORTSDIR}/multimedia/ffmpeg${FFMPEG_SUFFIX}
RUN_DEPENDS+=	ffmpeg${FFMPEG_SUFFIX}>0.11:${PORTSDIR}/multimedia/ffmpeg${FFMPEG_SUFFIX}
.else
CONFIGURE_ARGS+=	--disable-external-ffmpeg
PLIST_SUB+=	EXTERNAL_FFMPEG=""
.endif

.if ${PORT_OPTIONS:MLIBBLURAY}
CONFIGURE_ARGS+=	--enable-libbluray
LIB_DEPENDS+=	bluray:${PORTSDIR}/multimedia/libbluray
.else
CONFIGURE_ARGS+=	--disable-libbluray
.endif

.if ${PORT_OPTIONS:MHAL}
CONFIGURE_ARGS+=	--enable-hal
LIB_DEPENDS+=	hal:${PORTSDIR}/sysutils/hal
.else
CONFIGURE_ARGS+=	--disable-hal
.endif

.if ${PORT_OPTIONS:MLAME}
CONFIGURE_ARGS+=	--enable-libmp3lame
LIB_DEPENDS+=	mp3lame:${PORTSDIR}/audio/lame
.else
CONFIGURE_ARGS+=	--disable-libmp3lame
.endif

.if ${PORT_OPTIONS:MLIRC}
RUN_DEPENDS+=	lircd:${PORTSDIR}/comms/lirc
.endif

.if ${PORT_OPTIONS:MMYSQL}
CONFIGURE_ARGS+=	--enable-mysql
USE_MYSQL=	yes
.else
CONFIGURE_ARGS+=	--disable-mysql
.endif

.if ${PORT_OPTIONS:MNONFREE}
CONFIGURE_ARGS+=	--enable-non-free
NO_CDROM=	Restricted binary distribution
NO_PACKAGE=	${NO_CDROM}
.else
CONFIGURE_ARGS+=	--disable-non-free
.endif

.if ${PORT_OPTIONS:MPULSEAUDIO}
CONFIGURE_ARGS+=	--enable-pulse
LIB_DEPENDS+=	pulse:${PORTSDIR}/audio/pulseaudio
.else
CONFIGURE_ARGS+=	--disable-pulse
.endif

.if ${PORT_OPTIONS:MRTMP}
CONFIGURE_ARGS+=	--enable-rtmp
LIB_DEPENDS+=	rtmp:${PORTSDIR}/multimedia/rtmpdump
.else
CONFIGURE_ARGS+=	--disable-rtmp
.endif

.if ${PORT_OPTIONS:MSFTP}
CONFIGURE_ARGS+=	--enable-ssh
BUILD_DEPENDS+=	${LOCALBASE}/lib/libssh.so:${PORTSDIR}/security/libssh
RUN_DEPENDS+=	${LOCALBASE}/lib/libssh.so:${PORTSDIR}/security/libssh
.else
CONFIGURE_ARGS+=	--disable-ssh
.endif

.if ${PORT_OPTIONS:MSMB}
CONFIGURE_ARGS+=	--enable-samba
LIB_DEPENDS+=	smbclient:${PORTSDIR}/net/samba-libsmbclient
.else
CONFIGURE_ARGS+=	--disable-samba
.endif

.if ${PORT_OPTIONS:MVAAPI}
LIB_DEPENDS+=	va:${PORTSDIR}/multimedia/libva
CONFIGURE_ARGS+=	--enable-vaapi
.else
CONFIGURE_ARGS+=	--disable-vaapi
.endif

.if ${PORT_OPTIONS:MVDPAU}
LIB_DEPENDS+=	vdpau:${PORTSDIR}/multimedia/libvdpau
CONFIGURE_ARGS+=	--enable-vdpau
.else
CONFIGURE_ARGS+=	--disable-vdpau
.endif

.if ${PORT_OPTIONS:MVORBIS}
CONFIGURE_ARGS+=	--enable-libvorbisenc
LIB_DEPENDS+=	ogg:${PORTSDIR}/audio/libogg
.else
CONFIGURE_ARGS+=	--disable-libvorbisenc
.endif

.if ${PORT_OPTIONS:MWEBSERVER}
CONFIGURE_ARGS+=	--enable-webserver
LIB_DEPENDS+=	microhttpd:${PORTSDIR}/www/libmicrohttpd
.else
CONFIGURE_ARGS+=	--disable-webserver
.endif

post-patch:
	${REINPLACE_CMD} 's;"event\.h";"sidplay/event.h";' \
		${WRKSRC}/lib/libsidplay2/libsidplay/src/event.cpp \
		${WRKSRC}/lib/libsidplay2/libsidplay/src/mos6510/mos6510.h \
		${WRKSRC}/lib/libsidplay2/libsidplay/src/mos6526/mos6526.h \
		${WRKSRC}/lib/libsidplay2/libsidplay/src/mos656x/mos656x.h
	${REINPLACE_CMD} 's;make;gmake;' ${WRKSRC}/bootstrap
	${REINPLACE_CMD} 's;which swig;&2.0;' ${WRKSRC}/codegenerator.mk

run-autotools:
	@cd ${WRKSRC} && ${SH} ./bootstrap

post-install:
	@${INSTALL_MAN} ${WRKSRC}/docs/manpages/xbmc.bin.1 ${MAN1PREFIX}/man/man1

.include <bsd.port.mk>
