--- Makefile.inc.orig	2008-05-02 09:10:20.000000000 -0400
+++ Makefile.inc	2008-05-02 09:10:35.000000000 -0400
@@ -28,7 +28,7 @@
 SYSCONFDIR?=/etc
 
 INSTALLUSER?=root
-INSTALLGROUPDIR?=bin
+INSTALLGROUPDIR?=wheel
 INSTALLGROUPFILE?=wheel
 
 .SUFFIXES: .c .o .8 .cat8 .pm .cat3p
