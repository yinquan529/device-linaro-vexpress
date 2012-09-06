$(eval $(call MAKE_EDK2_ROM,ArmPlatformPkg/ArmVExpressPkg/ArmVExpress-CTA9x4.dsc -D EDK2_ARMVE_SINGLE_BINARY=1 -D EDK2_ARMVE_STANDALONE=1,ca9,ARMVEXPRESS_EFI,uefi_v2p-ca9.bin))
$(eval $(call MAKE_EDK2_ROM,ArmPlatformPkg/ArmVExpressPkg/ArmVExpress-CTA15x2.dsc -D EDK2_ARMVE_SINGLE_BINARY=1 -D EDK2_ARMVE_STANDALONE=1,ca15-tc1,ARMVEXPRESS_EFI,uefi_v2p-ca15-tc1.bin))
$(eval $(call MAKE_EDK2_ROM,ArmPlatformPkg/ArmVExpressPkg/ArmVExpress-CTA5s.dsc -D EDK2_ARMVE_SINGLE_BINARY=1 -D EDK2_ARMVE_STANDALONE=1,ca5s,ARMVEXPRESS_EFI,uefi_v2p-ca5s.bin))
