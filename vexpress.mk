# The vexpress product that is specialized for vexpress.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)
$(call inherit-product, device/linaro/common/common.mk)
$(call inherit-product, device/linaro/vexpress/device.mk)

PRODUCT_BRAND := vexpress
PRODUCT_DEVICE := vexpress
PRODUCT_NAME := vexpress
PRODUCT_MODEL := vexpress
PRODUCT_MANUFACTURER := ARM
