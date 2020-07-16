################################################################################
#
# client_hal_api
#
################################################################################

CLIENT_HAL_API_VERSION = $(shell echo "$(BR2_PACKAGE_CLIENT_HAL_API_VERSION)" |tr -d '"')
CLIENT_HAL_API_SITE = $(BR2_PACKAGE_CLIENT_HAL_API_URL)
CLIENT_HAL_API_SITE_METHOD = git
CLIENT_HAL_API_LICENSE = LGPL-2.1+
CLIENT_HAL_API_LICENSE_FILES = COPYING-LGPL-2.1

CLIENT_HAL_API_INSTALL_STAGING = YES

# client_hal_api needs access to imx-specific kernel headers
CLIENT_HAL_API_DEPENDENCIES += sig-libcomm

CLIENT_HAL_API_INCLUDE = 

CLIENT_HAL_API_MAKE_ENV = \
	$(TARGET_MAKE_ENV) \
	$(TARGET_CONFIGURE_OPTS) \
	CROSS_COMPILE="$(TARGET_CROSS)" \
	CFLAGS='$(CFLAGS) -I $(STAGING_DIR)/include'

define CLIENT_HAL_API_BUILD_CMDS
	$(CLIENT_HAL_API_MAKE_ENV) $(MAKE1) -C $(@D)/src
endef

define CLIENT_HAL_API_INSTALL_STAGING_CMDS
	$(CLIENT_HAL_API_MAKE_ENV) $(MAKE1) -C $(@D)/src DESTDIR=$(STAGING_DIR) install
endef

define CLIENT_HAL_API_INSTALL_TARGET_CMDS
	$(CLIENT_HAL_API_MAKE_ENV) $(MAKE1) -C $(@D)/src DESTDIR=$(TARGET_DIR) install
endef

$(eval $(generic-package))
