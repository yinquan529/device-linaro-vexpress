PRODUCT_COPY_FILES := \
    device/linaro/vexpress_a9/vold.fstab:system/etc/vold.fstab \
    device/linaro/vexpress_a9/egl.cfg:system/lib/egl/egl.cfg

PRODUCT_COPY_FILES += \
    device/linaro/common/init.rc:root/init.rc \
    device/linaro/vexpress_a9/init.arm-versatile.rc:root/init.arm-versatile.rc \
    device/linaro/vexpress_a9/init.vexpress_a9.sh:system/etc/init.vexpress_a9.sh \
    device/linaro/vexpress_a9/initlogo.rle:root/initlogo.rle

PRODUCT_CHARACTERISTICS := tablet,nosdcard
