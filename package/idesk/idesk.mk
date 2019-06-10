################################################################################
#
# idesk
#
################################################################################

IDESK_VERSION = 0.7.5
IDESK_SOURCE = idesk-$(IDESK_VERSION).tar.bz2
IDESK_SITE = http://sourceforge.net/projects/idesk/files/idesk/idesk-$(IDESK_VERSION)
IDESK_STRIP_COMPONENTS = 2
IDESK_INSTALL_STAGING = YES

IDESK_CONF_OPTS = \
		  --with-imlib2-prefix=$(STAGING_DIR)/usr \
		  --with-imlib2-exec-prefix=$(STAGING_DIR)/usr
IDESK_CONF_ENV = LIBS=-lImlib2
IDESK_DEPENDENCIES = imlib2 

$(eval $(autotools-package))
