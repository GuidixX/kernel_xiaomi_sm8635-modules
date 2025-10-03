ifeq ($(call is-board-platform-in-list,pineapple), true)
PRODUCT_PACKAGES += xlogchar.ko
PRODUCT_PACKAGES += dump_display.ko
PRODUCT_PACKAGES += aw8697-haptic.ko
endif
