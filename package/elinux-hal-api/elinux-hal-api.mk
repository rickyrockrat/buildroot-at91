################################################################################
#
# elinux_hal_api
#
################################################################################

ELINUX_HAL_API_VERSION = $(shell echo '$(BR2_PACKAGE_ELINUX_HAL_API_VERSION)' |tr -d '"')
ELINUX_HAL_API_SITE = $(BR2_PACKAGE_ELINUX_HAL_API_URL)
ELINUX_HAL_API_SITE_METHOD = git
ELINUX_HAL_API_LICENSE = LGPL-2.1+
ELINUX_HAL_API_LICENSE_FILES = COPYING-LGPL-2.1

ELINUX_HAL_API_INSTALL_STAGING = YES

# elinux_hal_api needs access to imx-specific kernel headers
#ELINUX_HAL_API_DEPENDENCIES += 
#ELINUX_HAL_API_INCLUDE = 

ELINUX_HAL_API_MAKE_ENV = \
	$(TARGET_MAKE_ENV) \
	$(TARGET_CONFIGURE_OPTS) \
	CROSS_COMPILE="$(TARGET_CROSS)" 

define ELINUX_HAL_API_BUILD_CMDS
	$(ELINUX_HAL_API_MAKE_ENV) $(MAKE1) -C $(@D/src
endef

define ELINUX_HAL_API_INSTALL_STAGING_CMDS
	$(ELINUX_HAL_API_MAKE_ENV) $(MAKE1) -C $(@D)/src DESTDIR=$(STAGING_DIR) install
endef

define ELINUX_HAL_API_INSTALL_TARGET_CMDS
	$(ELINUX_HAL_API_MAKE_ENV) $(MAKE1) -C $(@D)/src DESTDIR=$(TARGET_DIR) install
endef

$(eval $(generic-package))
