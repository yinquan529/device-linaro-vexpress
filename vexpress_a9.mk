# The vexpress_a9 product that is specialized for vexpress_a9.
$(call inherit-product, device/linaro/common/common.mk)
$(call inherit-product, device/linaro/vexpress_a9/device.mk)

PRODUCT_BRAND := vexpress_a9
PRODUCT_DEVICE := vexpress_a9
PRODUCT_NAME := vexpress_a9
