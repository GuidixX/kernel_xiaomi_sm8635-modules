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

endif
endif
endif
