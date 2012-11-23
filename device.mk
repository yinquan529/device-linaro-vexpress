PRODUCT_COPY_FILES := \
    device/linaro/common/init.partitions.rc:root/init.partitions.rc \
    device/linaro/vexpress/vold.fstab:system/etc/vold.fstab \
    device/linaro/vexpress/egl.cfg:system/lib/egl/egl.cfg

PRODUCT_COPY_FILES += \
    device/linaro/vexpress/init.arm-versatileexpress.rc:root/init.arm-versatileexpress.rc \
    device/linaro/vexpress/ueventd.arm-versatileexpress.rc:root/ueventd.arm-versatileexpress.rc \
    device/linaro/vexpress/init.v2p-aarch64.rc:root/init.v2p-aarch64.rc \
    device/linaro/vexpress/ueventd.v2p-aarch64.rc:root/ueventd.v2p-aarch64.rc \
    device/linaro/vexpress/init.vexpress.sh:system/etc/init.vexpress.sh \
    device/linaro/vexpress/initlogo.rle:root/initlogo.rle

PRODUCT_CHARACTERISTICS := tablet,nosdcard

PRODUCT_TAGS += dalvik.gc.type-precise

ifneq ($(wildcard $(TOP)/test/linaro/biglittle/sched_tests),)
PRODUCT_PACKAGES := \
        run_sched_test
endif

$(call inherit-product-if-exists, test/linaro/biglittle/task-placement-tests/install-scripts.mk)

PRODUCT_PACKAGES += audio.primary.vexpress

$(call inherit-product, frameworks/native/build/tablet-dalvik-heap.mk)
