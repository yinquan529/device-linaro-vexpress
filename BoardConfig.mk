# config.mk
# 
# Product-specific compile-time definitions.
#

TARGET_BOARD_PLATFORM := vexpress_a9
TARGET_NO_BOOTLOADER := true # Uses u-boot instead 
TARGET_NO_KERNEL := false
KERNEL_CONFIG := android_vexpress_a9_defconfig
TARGET_USE_UBOOT := true
UBOOT_CONFIG := vexpress_ca9x4_config
TARGET_USE_XLOADER := false
TARGET_NO_RECOVERY := true
TARGET_NO_RADIOIMAGE := true
TARGET_PROVIDES_INIT_RC := true
BOARD_USES_GENERIC_AUDIO := true
BOARD_USES_ALSA_AUDIO := false
OMAP_ENHANCEMENT := true
HARDWARE_OMX := false
USE_CAMERA_STUB := false

BOARD_HAVE_BLUETOOTH := false
BOARD_HAVE_BLUETOOTH_BCM := false

TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi

# Enable NEON feature
TARGET_ARCH_VARIANT := armv7-a-neon
ARCH_ARM_HAVE_TLS_REGISTER := true

EXTRA_PACKAGE_MANAGEMENT := false

TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_SPARSE_EXT_DISABLED := true

# bootargs
BOARD_KERNEL_CMDLINE := omapdss.def_disp=hdmi consoleblank=0

# Dual-Core Cortex A9
TARGET_CPU_SMP := true
TARGET_EXTRA_CFLAGS += -mtune=cortex-a9 -mcpu=cortex-a9
