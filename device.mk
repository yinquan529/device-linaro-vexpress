PRODUCT_COPY_FILES := \
    device/linaro/common/init.partitions.rc:root/init.partitions.rc \
    device/linaro/vexpress/vold.fstab:system/etc/vold.fstab \
    device/linaro/vexpress/egl.cfg:system/lib/egl/egl.cfg

PRODUCT_COPY_FILES += \
    device/linaro/vexpress/init.arm-versatileexpress.rc:root/init.arm-versatileexpress.rc \
    device/linaro/vexpress/ueventd.arm-versatileexpress.rc:root/ueventd.arm-versatileexpress.rc \
    device/linaro/vexpress/init.vexpress.sh:system/etc/init.vexpress.sh \
    device/linaro/vexpress/initlogo.rle:root/initlogo.rle

PRODUCT_CHARACTERISTICS := tablet,nosdcard

PRODUCT_TAGS += dalvik.gc.type-precise

ifneq ($(wildcard $(TOP)/test/linaro/biglittle/sched_tests),)
PRODUCT_PACKAGES := \
        test_suite
endif

$(call inherit-product, frameworks/native/build/tablet-dalvik-heap.mk)
