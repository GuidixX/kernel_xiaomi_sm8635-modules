ifeq ($(call is-board-platform-in-list,pineapple), true)
PRODUCT_PACKAGES += xlogchar.ko
endif
