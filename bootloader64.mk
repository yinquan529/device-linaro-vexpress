$(INSTALLED_BOOTTARBALL_TARGET): $(BOOTLOADER_OUT)/linux-system.axf

$(BOOTLOADER_OUT)/linux-system.axf: $(ACP) $(INSTALLED_KERNEL_TARGET) $(INSTALLED_RAMDISK_TARGET)
	ln -sf $(abspath $(KERNEL_OUT)/scripts/dtc/dtc) $(TOP)/boot-wrapper/dtc
	ln -sf $(abspath $(TOP)/kernel/arch/arm64/boot/dts/vexpress-v2p-aarch64.dts) $(TOP)/boot-wrapper/vexpress-v2p-aarch64.dts
	ln -sf $(abspath $(TOP)/kernel/arch/arm64/boot/dts/vexpress-v2m-rs1.dtsi) $(TOP)/boot-wrapper/vexpress-v2m-rs1.dtsi
	ln -sf $(abspath $(TOP)/kernel/arch/arm64/boot/dts/skeleton.dtsi) $(TOP)/boot-wrapper/skeleton.dtsi
	ln -sf $(abspath $(INSTALLED_KERNEL_TARGET)) $(TOP)/boot-wrapper/Image
	ln -sf $(abspath $(INSTALLED_RAMDISK_TARGET)) $(TOP)/boot-wrapper/filesystem.cpio.gz
	PATH=$(abspath $(TOP)/gcc-linaro-aarch64-linux-gnu-4.7/bin):$(PATH) && \
	$(MAKE) -C $(TOP)/boot-wrapper CROSS_COMPILE=aarch64-linux-gnu-
	@mkdir -p $(dir $@)
	$(ACP) -fpt $(TOP)/boot-wrapper/linux-system.axf $@
	rm $(TOP)/boot-wrapper/dtc
	rm $(TOP)/boot-wrapper/vexpress-v2p-aarch64.dts
	rm $(TOP)/boot-wrapper/vexpress-v2m-rs1.dtsi
	rm $(TOP)/boot-wrapper/skeleton.dtsi
	rm $(TOP)/boot-wrapper/Image
	rm $(TOP)/boot-wrapper/filesystem.cpio.gz

BOOTLOADER_TARGETS += $(BOOTLOADER_OUT)/linux-system.axf