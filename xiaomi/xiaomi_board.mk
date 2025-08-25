XIAOMI_DLKM_ENABLED := true
ifeq ($(TARGET_KERNEL_DLKM_DISABLE), true)
       ifeq ($(TARGET_KERNEL_DLKM_XIAOMI_OVERRIDE), false)
             XIAOMI_DLKM_ENABLED := false
       endif
endif

ifeq ($(XIAOMI_DLKM_ENABLED), true)
ifeq ($(call is-board-platform-in-list,pineapple), true)
BOARD_VENDOR_KERNEL_MODULES += $(KERNEL_MODULES_OUT)/xlogchar.ko
endif
endif
