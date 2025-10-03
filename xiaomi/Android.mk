# Android makefile for Xiaomi kernel modules
XIAOMI_DLKM_ENABLED := true
ifeq ($(TARGET_KERNEL_DLKM_DISABLE), true)
       ifeq ($(TARGET_KERNEL_DLKM_XIAOMI_OVERRIDE), false)
             XIAOMI_DLKM_ENABLED := false
       endif
endif

ifeq ($(XIAOMI_DLKM_ENABLED), true)

ifeq ($(call is-board-platform-in-list,pineapple), true)
ifneq (,$(filter arm aarch64 arm64, $(TARGET_ARCH)))

LOCAL_PATH := $(call my-dir)
LOCAL_MODULE_DDK_BUILD := true

DLKM_DIR   := device/qcom/common/dlkm

KBUILD_OPTIONS += CONFIG_XLOGCHAR=m
KBUILD_OPTIONS += CONFIG_MI_DUMP_DISPLAY=m
KBUILD_OPTIONS += CONFIG_INPUT_AW86927_HAPTIC=m
KBUILD_OPTIONS += CONFIG_SIH_VIBRATOR=m
KBUILD_OPTIONS += CONFIG_MI_THERMAL_INTERFACE=m
KBUILD_OPTIONS += CONFIG_REGULATOR_WL2866D=m

include $(CLEAR_VARS)
LOCAL_SRC_FILES := $(LOCAL_PATH)/drivers/char/xlogchar.c
LOCAL_MODULE := xlogchar.ko
LOCAL_MODULE_KBUILD_NAME := drivers/char/xlogchar.ko
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(KERNEL_MODULES_OUT)
include $(DLKM_DIR)/Build_external_kernelmodule.mk

include $(CLEAR_VARS)
LOCAL_SRC_FILES := $(LOCAL_PATH)/drivers/xiaomi/dump_display/dump_display.c
LOCAL_MODULE := dump_display.ko
LOCAL_MODULE_KBUILD_NAME := drivers/xiaomi/dump_display/dump_display.ko
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(KERNEL_MODULES_OUT)
include $(DLKM_DIR)/Build_external_kernelmodule.mk

include $(CLEAR_VARS)
LOCAL_SRC_FILES := $(LOCAL_PATH)/drivers/input/misc/aw86927_haptic/aw8697.c \
                   $(LOCAL_PATH)/drivers/input/misc/aw86927_haptic/aw86927.c \
                   $(LOCAL_PATH)/drivers/input/misc/aw86927_haptic/aw_haptic.c \
                   $(LOCAL_PATH)/drivers/input/misc/aw86927_haptic/ringbuffer.c
LOCAL_MODULE := aw8697-haptic.ko
LOCAL_MODULE_KBUILD_NAME := drivers/input/misc/aw86927_haptic/aw8697-haptic.ko
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(KERNEL_MODULES_OUT)
include $(DLKM_DIR)/Build_external_kernelmodule.mk

include $(CLEAR_VARS)
LOCAL_SRC_FILES := $(LOCAL_PATH)/drivers/input/misc/si_haptic/haptic.c \
                   $(LOCAL_PATH)/drivers/input/misc/si_haptic/haptic_mid.c \
                   $(LOCAL_PATH)/drivers/input/misc/si_haptic/haptic_misc.c \
                   $(LOCAL_PATH)/drivers/input/misc/si_haptic/haptic_regmap.c \
                   $(LOCAL_PATH)/drivers/input/misc/si_haptic/ringbuffer.c \
                   $(LOCAL_PATH)/drivers/input/misc/si_haptic/sih688x.c \
                   $(LOCAL_PATH)/drivers/input/misc/si_haptic/sih688x_func_config.c \
                   $(LOCAL_PATH)/drivers/input/misc/si_haptic/sih688x_reg.c
LOCAL_MODULE := si_haptic.ko
LOCAL_MODULE_KBUILD_NAME := drivers/input/misc/si_haptic/si_haptic.ko
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(KERNEL_MODULES_OUT)
include $(DLKM_DIR)/Build_external_kernelmodule.mk

include $(CLEAR_VARS)
LOCAL_SRC_FILES := $(LOCAL_PATH)/drivers/thermal/xiaomi/mi_thermal_interface.c
LOCAL_MODULE := mi_thermal_interface.ko
LOCAL_MODULE_KBUILD_NAME := drivers/thermal/xiaomi/mi_thermal_interface.ko
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(KERNEL_MODULES_OUT)
include $(DLKM_DIR)/Build_external_kernelmodule.mk

include $(CLEAR_VARS)
LOCAL_SRC_FILES := $(LOCAL_PATH)/drivers/regulator/wl2866d.c
LOCAL_MODULE := wl2866d.ko
LOCAL_MODULE_KBUILD_NAME := drivers/regulator/wl2866d.ko
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_PATH := $(KERNEL_MODULES_OUT)
include $(DLKM_DIR)/Build_external_kernelmodule.mk

endif
endif
endif
