################################################################################
#
# hal-sim
#
################################################################################

HAL_SIM_VERSION = $(shell echo '$(BR2_PACKAGE_HAL_SIM_VERSION)' |tr -d '"')
HAL_SIM_SITE = $(BR2_PACKAGE_HAL_SIM_URL)
HAL_SIM_SITE_METHOD = git
HAL_SIM_LICENSE = LGPL-2.1+
HAL_SIM_LICENSE_FILES = COPYING-LGPL-2.1

HAL_SIM_INSTALL_STAGING = YES

HAL_SIM_DEPENDENCIES += sig-libcomm client-hal-api
#HAL_SIM_INCLUDE =	-idirafter $(LINUX_DIR)/include/uapi

HAL_SIM_MAKE_ENV = \
	$(TARGET_MAKE_ENV) \
	$(TARGET_CONFIGURE_OPTS) INSTALL_DIR=$(STAGING_DIR)\
	CROSS_COMPILE="$(TARGET_CROSS)" \
	CFLAGS='$(CFLAGS) -I$(STAGING_DIR)/include'

define HAL_SIM_CONFIGURE_CMDS
	for x in sig_libcomm client_hal_api; do \
		for s in clone build install; do \
			touch $(@D)/src/$$x.$$s; \
		done; \
	done
endef

define HAL_SIM_BUILD_CMDS
	$(HAL_SIM_MAKE_ENV) $(MAKE1) -C $(@D)/src 
endef

define HAL_SIM_INSTALL_STAGING_CMDS
	$(HAL_SIM_MAKE_ENV) $(MAKE1) -C $(@D)/src DESTDIR=$(STAGING_DIR) install
endef

define HAL_SIM_INSTALL_TARGET_CMDS
	$(HAL_SIM_MAKE_ENV) $(MAKE1) -C $(@D)/src DESTDIR=$(TARGET_DIR) install
endef

$(eval $(generic-package))
