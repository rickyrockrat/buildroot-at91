################################################################################
#
# sig-libcomm
#
################################################################################

SIG_LIBCOMM_VERSION = $(shell echo "$(BR2_PACKAGE_SIG_LIBCOMM_VERSION)"|tr -d '"')
SIG_LIBCOMM_SITE = $(BR2_PACKAGE_SIG_LIBCOMM_URL)
SIG_LIBCOMM_SITE_METHOD = git
SIG_LIBCOMM_LICENSE = LGPL-2.1+
SIG_LIBCOMM_LICENSE_FILES = COPYING-LGPL-2.1

SIG_LIBCOMM_INSTALL_STAGING = YES

#SIG_LIBCOMM_DEPENDENCIES += linux
#SIG_LIBCOMM_INCLUDE = 

SIG_LIBCOMM_MAKE_ENV = \
	$(TARGET_MAKE_ENV) \
	$(TARGET_CONFIGURE_OPTS) \
	CROSS_COMPILE="$(TARGET_CROSS)" \
	INCLUDE="$(SIG_LIBCOMM_INCLUDE)"

define SIG_LIBCOMM_BUILD_CMDS
	$(SIG_LIBCOMM_MAKE_ENV) $(MAKE1) -C $(@D)/src -f $(@D)/src/Makefile.host $(BR2_PACKAGE_SIG_LIBCOMM_ARCH)
endef

define SIG_LIBCOMM_INSTALL_STAGING_CMDS
	$(SIG_LIBCOMM_MAKE_ENV) $(MAKE1) -C $(@D)/src -f $(@D)/src/Makefile.host DESTDIR=$(STAGING_DIR) BASE=$(BR2_PACKAGE_SIG_LIBCOMM_ARCH) install
endef

define SIG_LIBCOMM_INSTALL_TARGET_CMDS
	$(SIG_LIBCOMM_MAKE_ENV) $(MAKE1) -C $(@D)/src -f $(@D)/src/Makefile.host DESTDIR=$(TARGET_DIR) BASE=$(BR2_PACKAGE_SIG_LIBCOMM_ARCH) install
endef

$(eval $(generic-package))
