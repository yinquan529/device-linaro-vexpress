PRODUCT_COPY_FILES := \
    device/linaro/common/fstab.partitions:root/fstab.arm-versatileexpress \
    device/linaro/vexpress/fstab.arm-versatileexpress-usb:root/fstab.arm-versatileexpress-usb \
    device/linaro/common/fstab.partitions:root/fstab.v2p-aarch64 \
    device/linaro/vexpress/vold.fstab:system/etc/vold.fstab \
    device/linaro/vexpress/egl.cfg:system/lib/egl/egl.cfg

PRODUCT_COPY_FILES += \
    device/linaro/vexpress/init.arm-versatileexpress.rc:root/init.arm-versatileexpress.rc \
    device/linaro/vexpress/init.partitions.arm-versatileexpress.rc:root/init.partitions.arm-versatileexpress.rc \
    device/linaro/vexpress/ueventd.arm-versatileexpress.rc:root/ueventd.arm-versatileexpress.rc \
    device/linaro/vexpress/init.arm-versatileexpress.rc:root/init.arm-versatileexpress-usb.rc \
    device/linaro/vexpress/init.partitions.arm-versatileexpress-usb.rc:root/init.partitions.arm-versatileexpress-usb.rc \
    device/linaro/vexpress/ueventd.arm-versatileexpress.rc:root/ueventd.arm-versatileexpress-usb.rc \
    device/linaro/vexpress/init.v2p-aarch64.rc:root/init.v2p-aarch64.rc \
    device/linaro/vexpress/ueventd.v2p-aarch64.rc:root/ueventd.v2p-aarch64.rc \
    device/linaro/vexpress/init.vexpress.sh:system/etc/init.vexpress.sh \
    device/linaro/vexpress/initlogo.rle:root/initlogo.rle \
    device/linaro/vexpress/set_irq_affinity.sh:root/sbin/set_irq_affinity.sh \
    device/linaro/common/android.hardware.screen.xml:system/etc/permissions/android.hardware.screen.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml

PRODUCT_CHARACTERISTICS := tablet,nosdcard

ifeq ($(strip $(ANDROID_64)),true)
DEVICE_PACKAGE_OVERLAYS := \
    device/linaro/vexpress/overlay.v2p-aarch64

PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=120

PRODUCT_COPY_FILES += \
    device/linaro/vexpress/init.v2p-aarch64.sh:system/etc/init.v2p-aarch64.sh
else
DEVICE_PACKAGE_OVERLAYS := \
    device/linaro/vexpress/overlay
endif

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

$(call inherit-product-if-exists, external/linaro-android-kernel-test/product.mk)


$(call inherit-product-if-exists, frameworks/native/build/tablet-dalvik-heap.mk)
