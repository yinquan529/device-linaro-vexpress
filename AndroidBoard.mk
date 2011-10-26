LOCAL_PATH := $(call my-dir)

file := $(TARGET_OUT_KEYLAYOUT)/gpio-keys.kl
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/gpio-keys.kl | $(ACP)
	$(transform-prebuilt-to-target)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := gpio-keys.kcm
LOCAL_MODULE_TAGS := optional
include $(BUILD_KEY_CHAR_MAP)

file := $(TARGET_OUT_KEYLAYOUT)/Logitech_Logitech_USB_Keyboard.kl
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/Logitech_Logitech_USB_Keyboard.kl | $(ACP)
	$(transform-prebuilt-to-target)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := Logitech_Logitech_USB_Keyboard.kcm
LOCAL_MODULE_TAGS := optional
include $(BUILD_KEY_CHAR_MAP)

file := $(TARGET_ROOT_OUT)/init.rc
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/init.rc | $(ACP)
	$(transform-prebuilt-to-target)

file := $(TARGET_ROOT_OUT)/init.arm-versatile.rc
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/init.arm-versatile.rc | $(ACP)
	$(transform-prebuilt-to-target)

file := $(PRODUCT_OUT)/system/etc/init.vexpress_a9.sh
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/init.vexpress_a9.sh | $(ACP)
	$(transform-prebuilt-to-target)

file := $(TARGET_ROOT_OUT)/initlogo.rle
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/initlogo.rle | $(ACP)
	$(transform-prebuilt-to-target)

