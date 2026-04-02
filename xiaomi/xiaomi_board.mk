XIAOMI_DLKM_ENABLED := true
ifeq ($(TARGET_KERNEL_DLKM_DISABLE), true)
       ifeq ($(TARGET_KERNEL_DLKM_XIAOMI_OVERRIDE), false)
             XIAOMI_DLKM_ENABLED := false
       endif
endif
