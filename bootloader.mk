ifneq ($(strip $(ANDROID_64)),true)
$(eval $(call MAKE_EDK2_ROM,ArmPlatformPkg/ArmVExpressPkg/ArmVExpress-CTA9x4.dsc -D EDK2_ARMVE_SINGLE_BINARY=1 -D EDK2_ARMVE_STANDALONE=1,ca9,ARMVEXPRESS_EFI,uefi_v2p-ca9.bin))
$(eval $(call MAKE_EDK2_ROM,ArmPlatformPkg/ArmVExpressPkg/ArmVExpress-CTA15x2.dsc -D EDK2_ARMVE_SINGLE_BINARY=1 -D EDK2_ARMVE_STANDALONE=1,ca15-tc1,ARMVEXPRESS_EFI,uefi_v2p-ca15-tc1.bin))
$(eval $(call MAKE_EDK2_ROM,ArmPlatformPkg/ArmVExpressPkg/ArmVExpress-CTA5s.dsc -D EDK2_ARMVE_SINGLE_BINARY=1 -D EDK2_ARMVE_STANDALONE=1,ca5s,ARMVEXPRESS_EFI,uefi_v2p-ca5s.bin))
$(eval $(call MAKE_EDK2_ROM,ArmPlatformPkg/ArmVExpressPkg/ArmVExpress-CTA15-A7.dsc -D ARM_BIGLITTLE_TC2=1 -D EDK2_ARMVE_SINGLE_BINARY=1,ca15-tc2,ARM_VEXPRESS_CTA15A7_EFI,uefi_v2p-ca15-tc2.bin))
$(eval $(call MAKE_EDK2_ROM,ArmPlatformPkg/ArmVExpressPkg/ArmVExpress-RTSM-A9x4.dsc -D EDK2_ARMVE_STANDALONE=1,rtsm-ca9,RTSM_VE_CORTEX-A9_EFI,rtsm/uefi_rtsm_ve-ca9x4.bin))
$(eval $(call MAKE_EDK2_ROM,ArmPlatformPkg/ArmVExpressPkg/ArmVExpress-RTSM-A15_MPCore.dsc -D EDK2_ARMVE_STANDALONE=1,rtsm-ca15,RTSM_VE_CORTEX-A15_MPCORE_EFI,rtsm/uefi_rtsm_ve-ca15.bin))


#
# RTSM semi-hosting boot-wrapper
#
$(BOOTLOADER_OUT)/rtsm/linux-system-semi.axf : $(ACP) FORCE_BOOTLOADER_REMAKE
	cd $(TOP)/boot-wrapper && $(MAKE_RTSM_BOOTWRAPPER) linux-system-semi.axf
	@mkdir -p $(dir $@)
	$(ACP) -fpt $(TOP)/boot-wrapper/linux-system-semi.axf $@

BOOTLOADER_TARGETS += $(BOOTLOADER_OUT)/rtsm/linux-system-semi.axf


include $(call my-dir)/bootloader-uboot-files.mk

else
$(eval $(call MAKE_EDK2_ROM,ArmPlatformPkg/ArmVExpressPkg/ArmVExpress-FVP-AArch64.dsc,fvp-base,FVP_AARCH64_EFI,uefi_fvp-base.bin,AARCH64))
endif
