PRODUCT_COPY_FILES := \
    device/linaro/vexpress_a9/vold.fstab:system/etc/vold.fstab \
    device/linaro/vexpress_a9/egl.cfg:system/lib/egl/egl.cfg

PRODUCT_COPY_FILES += \
    device/linaro/vexpress_a9/init.arm-versatileexpress.rc:root/init.arm-versatileexpress.rc \
    device/linaro/vexpress_a9/init.vexpress_a9.sh:system/etc/init.vexpress_a9.sh \
    device/linaro/vexpress_a9/initlogo.rle:root/initlogo.rle

PRODUCT_CHARACTERISTICS := tablet,nosdcard

PRODUCT_TAGS += dalvik.gc.type-precise

$(call inherit-product, frameworks/base/build/tablet-dalvik-heap.mk)
