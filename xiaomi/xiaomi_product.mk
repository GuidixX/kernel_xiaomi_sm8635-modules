ifeq ($(call is-board-platform-in-list,pineapple), true)
PRODUCT_PACKAGES += xlogchar.ko
PRODUCT_PACKAGES += dump_display.ko
PRODUCT_PACKAGES += aw8697-haptic.ko
PRODUCT_PACKAGES += si_haptic.ko
PRODUCT_PACKAGES += mi_thermal_interface.ko
PRODUCT_PACKAGES += wl2866d.ko
endif
