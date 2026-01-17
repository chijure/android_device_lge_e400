# device.mk para TWRP minimal en lge e400

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery.fstab:recovery/root/etc/recovery.fstab

PRODUCT_DEVICE := e400
PRODUCT_NAME := omni_e400
PRODUCT_BRAND := lge
PRODUCT_MODEL := e400
PRODUCT_MANUFACTURER := lge
