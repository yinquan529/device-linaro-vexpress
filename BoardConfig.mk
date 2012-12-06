# config.mk
# 
# Product-specific compile-time definitions.
#

TARGET_BOARD_PLATFORM := vexpress
TARGET_NO_BOOTLOADER := true # Uses u-boot instead 
TARGET_NO_KERNEL := false
ifeq ($(strip $(ANDROID_64)),true)
KERNEL_TOOLS_PREFIX := aarch64-linux-gnu-
KERNEL_CONFIG := vexpress-android_defconfig
TARGET_USE_UBOOT := false
CUSTOM_BOOTLOADER_MAKEFILE := device/linaro/vexpress/bootloader64.mk
else
#
# Build IKS kernel depending on config.
#
ifneq ($(strip $(BUILD_IKS)),true)
KERNEL_CONFIG := linaro/configs/linaro-base.conf \
                 linaro/configs/android.conf \
                 linaro/configs/big-LITTLE-MP.conf \
                 linaro/configs/vexpress.conf
ifeq ($(wildcard $(TOP)/boot-wrapper/bootwrapper.mk),)
TARGET_USE_UBOOT := true
UBOOT_CONFIG := vexpress_ca9x4_config
UBOOT_FLAVOURS := vexpress_ca9x4:u-boot_v2p-ca9.bin vexpress_ca5x2:u-boot_v2p-ca5s.bin vexpress_ca15x2:u-boot_v2p-ca15-tc1.bin
DEVICE_TREES := vexpress-v2p-ca5s:v2p-ca5s.dtb vexpress-v2p-ca9:v2p-ca9.dtb vexpress-v2p-ca15-tc1:v2p-ca15-tc1.dtb vexpress-v2p-ca15-tc2:v2p-ca15-tc2.dtb \
		rtsm_ve-cortex_a9x2:rtsm/rtsm_ve-ca9x2.dtb \
		rtsm_ve-cortex_a9x4:rtsm/rtsm_ve-ca9x4.dtb \
		rtsm_ve-cortex_a15x1:rtsm/rtsm_ve-ca15x1.dtb \
		rtsm_ve-cortex_a15x2:rtsm/rtsm_ve-ca15x2.dtb \
		rtsm_ve-cortex_a15x4:rtsm/rtsm_ve-ca15x4.dtb \
		rtsm_ve-v2p-ca15x1-ca7x1:rtsm/rtsm_ve-ca15x1-ca7x1.dtb \
		rtsm_ve-v2p-ca15x4-ca7x4:rtsm/rtsm_ve-ca15x4-ca7x4.dtb
CUSTOM_BOOTLOADER_MAKEFILE := device/linaro/vexpress/bootloader.mk
else
TARGET_USE_UBOOT := false
DEVICE_TREES := rtsm_ve-v2p-ca15x1-ca7x1:rtsm/rtsm_ve-ca15x1-ca7x1.dtb \
		rtsm_ve-v2p-ca15x4-ca7x4:rtsm/rtsm_ve-ca15x4-ca7x4.dtb
CUSTOM_BOOTLOADER_MAKEFILE := boot-wrapper/bootwrapper.mk
endif
else
KERNEL_CONFIG := vexpress_bL_defconfig
TARGET_USE_UBOOT := true
UBOOT_CONFIG := vexpress_ca5x2
DEVICE_TREES := vexpress-v2p-ca15-tc2:vexpress-v2p-ca15-tc2.dtb
endif
endif
TARGET_USE_XLOADER := false
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

# bootargs
BOARD_KERNEL_CMDLINE := mmci.fmax=4000000

# Dual-Core Cortex A9
TARGET_CPU_SMP := true
#TARGET_EXTRA_CFLAGS += -mtune=cortex-a9 -mcpu=cortex-a9

# ARMs gator (DS-5)
TARGET_USE_GATOR:= true

ifeq ($(strip $(ANDROID_64)),true)
TARGET_BOOTLOADER_TYPE := none
else
ifeq ($(wildcard $(TOP)/boot-wrapper/bootwrapper.mk),)
# Build uImage and uInitrd instead of kernel and ramdisk.img
TARGET_BOOTLOADER_TYPE := uboot
endif
endif
