# config.mk
# 
# Product-specific compile-time definitions.
#

TARGET_BOARD_PLATFORM := vexpress_a9
TARGET_NO_BOOTLOADER := true # Uses u-boot instead 
TARGET_NO_KERNEL := false
KERNEL_CONFIG := android_vexpress_defconfig
TARGET_USE_UBOOT := true
UBOOT_CONFIG := vexpress_ca9x4_config
UBOOT_FLAVOURS := vexpress_ca9x4:u-boot_v2p-ca9.bin vexpress_ca5x2:u-boot_v2p-ca5s.bin
DEVICE_TREES := vexpress-v2p-ca5s:v2p-ca5s.dtb vexpress-v2p-ca9:v2p-ca9.dtb vexpress-v2p-ca15-tc1:v2p-ca15-tc1.dtb
TARGET_USE_XLOADER := false
TARGET_NO_RECOVERY := true
TARGET_NO_RADIOIMAGE := true
TARGET_PROVIDES_INIT_RC := true
BOARD_USES_GENERIC_AUDIO := true
BOARD_USES_ALSA_AUDIO := false
HARDWARE_OMX := false
USE_CAMERA_STUB := false

BOARD_HAVE_BLUETOOTH := false

TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi

# Enable NEON feature
TARGET_ARCH_VARIANT := armv7-a-neon
ARCH_ARM_HAVE_TLS_REGISTER := true

EXTRA_PACKAGE_MANAGEMENT := false

TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_SPARSE_EXT_DISABLED := true

# bootargs
BOARD_KERNEL_CMDLINE := mem=1024M clcd=xvga consoleblank=0 mmci.fmax=4000000

# Dual-Core Cortex A9
TARGET_CPU_SMP := true
#TARGET_EXTRA_CFLAGS += -mtune=cortex-a9 -mcpu=cortex-a9

# ARMs gator (DS-5)
TARGET_USE_GATOR:= true