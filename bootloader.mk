$(eval $(call MAKE_EDK2_ROM,ArmPlatformPkg/ArmVExpressPkg/ArmVExpress-CTA9x4.dsc -D EDK2_ARMVE_SINGLE_BINARY=1 -D EDK2_ARMVE_STANDALONE=1,ca9,ARMVEXPRESS_EFI,uefi_v2p-ca9.bin))
$(eval $(call MAKE_EDK2_ROM,ArmPlatformPkg/ArmVExpressPkg/ArmVExpress-CTA15x2.dsc -D EDK2_ARMVE_SINGLE_BINARY=1 -D EDK2_ARMVE_STANDALONE=1,ca15-tc1,ARMVEXPRESS_EFI,uefi_v2p-ca15-tc1.bin))
$(eval $(call MAKE_EDK2_ROM,ArmPlatformPkg/ArmVExpressPkg/ArmVExpress-CTA5s.dsc -D EDK2_ARMVE_SINGLE_BINARY=1 -D EDK2_ARMVE_STANDALONE=1,ca5s,ARMVEXPRESS_EFI,uefi_v2p-ca5s.bin))
$(eval $(call MAKE_EDK2_ROM,ArmPlatformPkg/ArmVExpressPkg/ArmVExpress-CTA15-A7.dsc -D ARM_BIGLITTLE_TC2=1 -D EDK2_ARMVE_SINGLE_BINARY=1,ca15-tc2,ARM_VEXPRESS_CTA15A7_EFI,uefi_v2p-ca15-tc2.bin))


#
# RTSM semi-hosting boot-wrapper
#
$(BOOTLOADER_OUT)/rtsm/linux-system-semi.axf : $(ACP) FORCE_BOOTLOADER_REMAKE
	cd $(TOP)/boot-wrapper && $(MAKE_RTSM_BOOTWRAPPER) linux-system-semi.axf
	@mkdir -p $(dir $@)
	$(ACP) -fpt $(TOP)/boot-wrapper/linux-system-semi.axf $@

BOOTLOADER_TARGETS += $(BOOTLOADER_OUT)/rtsm/linux-system-semi.axf


#
# Temporary (hopefully) ability to build uImage and uInitrd for
# compatibility purposes during transition to zImage...
#
ifneq ($(strip $(TARGET_BOOTLOADER_TYPE)),uboot)
ifeq ($(strip $(MAKE_UIMAGE_AND_UINITRD)),true)

$(BOOTLOADER_OUT)/uImage : $(INSTALLED_KERNEL_TARGET)
	$(eval UIMAGE_LOADADDR ?= 0x60008000)
	mkimage -A arm -O linux -T kernel -n "Android Kernel" -C none -a $(UIMAGE_LOADADDR) -e $(UIMAGE_LOADADDR) -d $< $@

BOOTLOADER_TARGETS += $(BOOTLOADER_OUT)/uImage

$(BOOTLOADER_OUT)/uInitrd : $(INSTALLED_RAMDISK_TARGET)
	mkimage -A arm -O linux -T ramdisk -n "Android Ramdisk Image" -d $< $@

BOOTLOADER_TARGETS += $(BOOTLOADER_OUT)/uInitrd

endif
endif