# config.mk
# 
# Product-specific compile-time definitions.
#

TARGET_BOARD_PLATFORM := vexpress
TARGET_NO_BOOTLOADER := true # We use our own methods for building bootloaders
TARGET_NO_KERNEL := false
TARGET_HWPACK_CONFIG := device/linaro/vexpress/config

TARGET_USE_XLOADER := false
TARGET_USE_UBOOT := false
TARGET_NO_RECOVERY := true
TARGET_NO_RADIOIMAGE := true
BOARD_USES_GENERIC_AUDIO := false
BOARD_USES_ALSA_AUDIO := false
HARDWARE_OMX := false
USE_CAMERA_STUB := false

BOARD_HAVE_BLUETOOTH := false

TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi

TARGET_ARCH := arm
# Enable NEON feature
TARGET_ARCH_VARIANT := armv7-a-neon
ARCH_ARM_HAVE_TLS_REGISTER := true

EXTRA_PACKAGE_MANAGEMENT := false

TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_SPARSE_EXT_DISABLED := true

TARGET_CPU_SMP := true

# ARMs gator (DS-5)
TARGET_USE_GATOR:= true


ifeq ($(strip $(ANDROID_64)),true)
#
# Juice
#
KERNEL_TOOLS_PREFIX := aarch64-linux-android-
KERNEL_CONFIG ?= linaro/configs/linaro-base.conf \
                 linaro/configs/android.conf \
                 linaro/configs/vexpress64.conf \
                 linaro/configs/vexpress-tuning.conf \
                 linaro/configs/juice.conf
CUSTOM_BOOTLOADER_MAKEFILE := device/linaro/vexpress/bootloader.mk
TARGET_KERNEL_SOURCE ?= kernel/linaro/juice
ifneq ($(wildcard $(TOP)/kernel/linaro/juice),)
DEVICE_TREES := fvp-base-gicv2-psci-android:fvp-base-gicv2-psci.dtb fvp-base-gicv2-psci-android:fdt.dtb
else
DEVICE_TREES := fvp-base-gicv2-psci:fvp-base-gicv2-psci.dtb fvp-base-gicv2-psci:fdt.dtb
endif

TARGET_CPU_VARIANT := cortex-a15

else ifeq ($(strip $(BUILD_IKS)),true)
#
# IKS
#
ifeq ($(KERNEL_CONFIG),)
KERNEL_CONFIG ?= linaro/configs/linaro-base.conf \
                 linaro/configs/android.conf \
                 linaro/configs/big-LITTLE-MP.conf \
                 linaro/configs/vexpress.conf \
                 linaro/configs/vexpress-tuning.conf \
                 linaro/configs/big-LITTLE-IKS.conf
endif
DEVICE_TREES := vexpress-v2p-ca15_a7:v2p-ca15-tc2.dtb
UBOOT_FLAVOURS := vexpress_ca5x2:u-boot.bin
CUSTOM_BOOTLOADER_MAKEFILE := device/linaro/vexpress/bootloader-uboot-files.mk
INSTALLED_KERNEL_TARGET_NAME := zImage
INSTALLED_RAMDISK_TARGET_NAME := initrd
#
# Exporting the kernel and uboot source path explicitly since the path
# are not based on TARGET_PRODUCT.
#
TARGET_UBOOT_SOURCE := u-boot/linaro/vexpress-iks
TARGET_KERNEL_SOURCE := kernel/linaro/vexpress-iks

TARGET_CPU_VARIANT := cortex-a9

else
#
# MP
#
include $(TOPDIR)device/linaro/common/linaro_configs.mk
KERNEL_CONFIG ?= linaro/configs/linaro-base.conf \
                 linaro/configs/android.conf \
                 linaro/configs/big-LITTLE-MP.conf \
                 linaro/configs/vexpress.conf \
                 linaro/configs/big-LITTLE-IKS.conf \
                 linaro/configs/vexpress-tuning.conf
DEVICE_TREES := vexpress-v2p-ca5s:v2p-ca5s.dtb \
		vexpress-v2p-ca9:v2p-ca9.dtb \
		vexpress-v2p-ca15-tc1:v2p-ca15-tc1.dtb \
		vexpress-v2p-ca15_a7:v2p-ca15-tc2.dtb \
		rtsm_ve-cortex_a9x2:rtsm/rtsm_ve-ca9x2.dtb \
		rtsm_ve-cortex_a9x4:rtsm/rtsm_ve-ca9x4.dtb \
		rtsm_ve-cortex_a15x1:rtsm/rtsm_ve-ca15x1.dtb \
		rtsm_ve-cortex_a15x2:rtsm/rtsm_ve-ca15x2.dtb \
		rtsm_ve-cortex_a15x4:rtsm/rtsm_ve-ca15x4.dtb \
		rtsm_ve-v2p-ca15x1-ca7x1:rtsm/rtsm_ve-ca15x1-ca7x1.dtb \
		rtsm_ve-v2p-ca15x4-ca7x4:rtsm/rtsm_ve-ca15x4-ca7x4.dtb
UBOOT_FLAVOURS := vexpress_ca9x4:u-boot_v2p-ca9.bin \
		  vexpress_ca5x2:u-boot_v2p-ca5s.bin \
		  vexpress_ca15x2:u-boot_v2p-ca15-tc1.bin
CUSTOM_BOOTLOADER_MAKEFILE := device/linaro/vexpress/bootloader.mk
INSTALLED_KERNEL_TARGET_NAME := zImage
INSTALLED_RAMDISK_TARGET_NAME := initrd
INCLUDE_PERF := 0

TARGET_CPU_VARIANT := cortex-a9

endif


