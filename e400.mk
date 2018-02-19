# Inherit from those products. Most specific first
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/telephony.mk)
$(call inherit-product, vendor/qcom/opensource/omx/mm-core/Android.mk)
$(call inherit-product, vendor/qcom/opensource/omx/mm-video/Android.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/lge/e400/e400-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/lge/e400/overlay

PRODUCT_AAPT_CONFIG := normal mdpi ldpi
PRODUCT_AAPT_PREF_CONFIG := ldpi

# Permission files
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml

# Board-specific init
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/root/init.e0.rc:root/init.e0.rc \
    $(LOCAL_PATH)/root/ueventd.e0.rc:root/ueventd.e0.rc \
    $(LOCAL_PATH)/root/init.e0.usb.rc:root/init.e0.usb.rc

# Configs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/7k_handset.kl:system/usr/keylayout/7k_handset.kl \
    $(LOCAL_PATH)/configs/e0_keypad.kl:system/usr/keylayout/e0_keypad.kl \
    $(LOCAL_PATH)/configs/touch_mcs8000.idc:system/usr/idc/touch_mcs8000.idc \
    $(LOCAL_PATH)/configs/touch_mcs8000.kl:system/usr/keylayout/touch_mcs8000.idc

# BT startup
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/init.qcom.bt.sh:system/etc/init.qcom.bt.sh

# Wifi
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    $(LOCAL_PATH)/prebuilt/wlan.ko:system/lib/modules/wlan.ko

# SD Card
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/vold.fstab:system/etc/vold.fstab

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/AudioFilter.csv:system/etc/AudioFilter.csv \
    $(LOCAL_PATH)/configs/AutoVolumeControl.txt:system/etc/AutoVolumeControl.txt \
    $(LOCAL_PATH)/configs/media_profiles.xml:system/etc/media_profiles.xml

# Display
PRODUCT_PACKAGES += \
    libgenlock \
    gralloc.msm7x27a \
    copybit.msm7x27a \
    hwcomposer.msm7x27a

# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.primary.msm7x27a \
    audio_policy.msm7x27a \
    libaudioutils

# Filesystem management tools
PRODUCT_PACKAGES += \
    make_ext4fs \
    setup_fs

# Video decoding
PRODUCT_PACKAGES += \
    libstagefrighthw \
    libmm-omxcore \
    libOmxCore \
    libOmxVdec \
    libOmxVenc \
    libdivxdrmdecrypt

# Apps
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory \
    CMFileManager

# Other
PRODUCT_PACKAGES += \
    camera.e400 \
    gps.e400 \
    hwprops

PRODUCT_TAGS += dalvik.gc.type-precise
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapstartsize=5m \
    dalvik.vm.heapgrowthlimit=24m \
    dalvik.vm.heapsize=32m

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/chgchk:system/bin/chgchk

PRODUCT_PACKAGES += \
    liboverlay \
    charger \
    charger_res_images

# Battery life hacks
PRODUCT_PROPERTY_OVERRIDES += \
    # Better sleep system
    pm.sleep_mode=1
    # Scan for WiFi less often to increase batery life
    wifi.supplicant_scan_interval=180


PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := cm_e400
PRODUCT_DEVICE := e400
PRODUCT_MODEL := LG-E400
