################################################################################
#
# bard
#
################################################################################

BARD_VERSION = master
BARD_SITE = https://github.com/Brasserie-De-Toulbroch/bard
BARD_SITE_METHOD = git
BARD_INSTALL_STAGING = YES
BARD_INSTALL_TARGET = YES

$(eval $(cmake-package))
