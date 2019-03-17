################################################################################
#
# druid
#
################################################################################

DRUID_VERSION = master
DRUID_SITE = https://github.com/Brasserie-De-Toulbroch/druid
DRUID_SITE_METHOD = git
DRUID_INSTALL_STAGING = NO
DRUID_INSTALL_TARGET = YES
DRUID_DEPENDENCIES = qt5base qwt

$(eval $(cmake-package))
