ifeq ($(BUILD_IKS),true)
PRODUCT_COPY_FILES := \
    device/linaro/vexpress/fstab.partitions.usb:root/fstab.partitions
else
PRODUCT_COPY_FILES := \
    device/linaro/common/fstab.partitions:root/fstab.partitions
endif

PRODUCT_COPY_FILES += \
    device/linaro/common/init.partitions.rc:root/init.partitions.rc \
    device/linaro/vexpress/vold.fstab:system/etc/vold.fstab \
    device/linaro/vexpress/egl.cfg:system/lib/egl/egl.cfg

PRODUCT_COPY_FILES += \
    device/linaro/vexpress/init.arm-versatileexpress.rc:root/init.arm-versatileexpress.rc \
    device/linaro/vexpress/ueventd.arm-versatileexpress.rc:root/ueventd.arm-versatileexpress.rc \
    device/linaro/vexpress/init.v2p-aarch64.rc:root/init.v2p-aarch64.rc \
    device/linaro/vexpress/ueventd.v2p-aarch64.rc:root/ueventd.v2p-aarch64.rc \
    device/linaro/vexpress/init.vexpress.sh:system/etc/init.vexpress.sh \
    device/linaro/vexpress/initlogo.rle:root/initlogo.rle \
    device/linaro/vexpress/set_irq_affinity.sh:root/sbin/set_irq_affinity.sh

PRODUCT_CHARACTERISTICS := tablet,nosdcard

DEVICE_PACKAGE_OVERLAYS := \
    device/linaro/vexpress/overlay

PRODUCT_PROPERTY_OVERRIDES += \
        ro.nohardwaregfx=true \
        debug.sf.no_hw_vsync=1

PRODUCT_TAGS += dalvik.gc.type-precise

ifneq ($(wildcard $(TOP)/test/linaro/biglittle/sched_tests),)
PRODUCT_PACKAGES := \
        run_sched_test
endif

ifneq ($(wildcard $(TOP)/test/linaro/biglittle/core/bl-agitator),)
PRODUCT_PACKAGES := \
        bl-agitator
endif

$(call inherit-product-if-exists, test/linaro/biglittle/task-placement-tests/install-scripts.mk)
$(call inherit-product-if-exists, test/linaro/biglittle/core/install-scripts.mk)

PRODUCT_PACKAGES += audio.primary.vexpress

$(call inherit-product, frameworks/native/build/tablet-dalvik-heap.mk)
