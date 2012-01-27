$(eval $(call MAKE_EDK2_ROM,ArmPlatformPkg/ArmVExpressPkg/ArmVExpress-CTA9x4.dsc -D EDK2_ARMVE_SINGLE_BINARY=1 -D EDK2_ARMVE_STANDALONE=1,ca9,ARMVEXPRESS_EFI,uefi_v2p-ca9.bin))
