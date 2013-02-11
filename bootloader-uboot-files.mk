#
# Temporary (hopefully) ability to build uImage and uInitrd for
# compatibility purposes during transition to zImage...
#
$(BOOTLOADER_OUT)/uImage : $(INSTALLED_KERNEL_TARGET)
	$(eval UIMAGE_LOADADDR ?= 0x60008000)
	mkimage -A arm -O linux -T kernel -n "Android Kernel" -C none -a $(UIMAGE_LOADADDR) -e $(UIMAGE_LOADADDR) -d $< $@

BOOTLOADER_TARGETS += $(BOOTLOADER_OUT)/uImage

$(BOOTLOADER_OUT)/uInitrd : $(INSTALLED_RAMDISK_TARGET)
	mkimage -A arm -O linux -T ramdisk -n "Android Ramdisk Image" -d $< $@

BOOTLOADER_TARGETS += $(BOOTLOADER_OUT)/uInitrd
