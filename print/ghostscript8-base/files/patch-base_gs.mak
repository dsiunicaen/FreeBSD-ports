--- base/gs.mak.orig	2009-11-11 17:42:22 UTC
+++ base/gs.mak
@@ -415,7 +415,7 @@ GCONFIG_EXTRAS=
 ld_tr=$(GLGENDIR)$(D)ld.tr
 $(ld_tr) : \
   $(GS_MAK) $(TOP_MAKEFILES) $(GLSRCDIR)$(D)version.mak $(GENCONF_XE) $(ECHOGS_XE) $(devs_tr) $(DEVS_ALL) $(GLGENDIR)$(D)libcore.dev
-	$(EXP)$(GENCONF_XE) $(devs_tr) -h $(gconfig_h) $(CONFILES) $(CONFLDTR) $(ld_tr)
+	$(EXP)$(GENCONF_XE) $(devs_tr) -h /dev/stdout $(CONFILES) $(CONFLDTR) $(ld_tr) | awk 'BEGIN{j=0; p=1;} /jpeg_device/ {if(j++ > 0) p=0;} // {if(p==1) { print; } else { p=1 } }' > $(gconfig_h)
 	$(EXP)$(ECHOGS_XE) -a $(gconfig_h) $(GCONFIG_EXTRAS)
 
 $(gconfig_h) : $(ld_tr)
