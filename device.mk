#
# Copyright (C) 2011 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# This file includes all definitions that apply to ALL geehrc devices, and
# are also specific to geehrc devices
#
# Everything in this directory will become public

## (2) Also get non-open-source specific aspects if available
$(call inherit-product-if-exists, vendor/lge/gee/gee-vendor.mk)

## overlays
DEVICE_PACKAGE_OVERLAYS += device/lge/geeb_att_full/overlay-gsm

## common overlays
DEVICE_PACKAGE_OVERLAYS += device/lge/geeb_att_full/overlay

# This device is xhdpi.  However the platform doesn't
# currently contain all of the bitmaps at xhdpi density so
# we do this little trick to fall back to the hdpi version
# if the xhdpi doesn't exist.
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

PRODUCT_PACKAGES += \
    charger_res_images \
    charger

# Live Wallpapers
PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    VisualizationWallpapers \
    librs_jni

# Enable Torch
PRODUCT_PACKAGES += \
	Torch

# Ramdisk
PRODUCT_COPY_FILES += \
        device/lge/geeb_att_full/ramdisk/init.gee.rc:root/init.gee.rc \
        device/lge/geeb_att_full/ramdisk/init.gee.usb.rc:root/init.gee.usb.rc \
        device/lge/geeb_att_full/ramdisk/init.gee.usb.sh:root/init.gee.usb.sh \
        device/lge/geeb_att_full/ramdisk/init.qcom.sh:root/init.qcom.sh \
	device/lge/geeb_att_full/ramdisk/init.geeb_att_full.rc:root/init.geeb_att_full.rc \
	device/lge/geeb_att_full/ramdisk/ueventd.geeb_att_full.rc:root/ueventd.geeb_att_full.rc \
	device/lge/geeb_att_full/ramdisk/fstab.gee:root/fstab.gee

# WiFi
PRODUCT_COPY_FILES += \
	device/lge/geeb_att_full/wifi/WCNSS_cfg.dat:system/vendor/firmware/wlan/prima/WCNSS_cfg.dat \
	device/lge/geeb_att_full/wifi/WCNSS_qcom_cfg.ini:system/etc/wifi/WCNSS_qcom_cfg.ini \
	device/lge/geeb_att_full/wifi/WCNSS_qcom_wlan_nv.bin:system/etc/wifi/WCNSS_qcom_wlan_nv.bin \
        device/lge/geeb_att_full/wifi/wpa_supplicant.conf:obj/etc/wifi/wpa_supplicant.conf \
        device/lge/geeb_att_full/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf

# Audio SND SOC Config
PRODUCT_COPY_FILES += \
	device/lge/geeb_att_full/snd_soc_msm/snd_soc_msm_2x_Fusion3:system/etc/snd_soc_msm/snd_soc_msm_2x_Fusion3

# Audio Policy Config
PRODUCT_COPY_FILES += \
        device/lge/geeb_att_full/configs/audio_policy.conf:system/etc/audio_policy.conf \

# Thermal Daemon
PRODUCT_COPY_FILES += \
	device/lge/geeb_att_full/configs/thermald-gee-common.conf:system/etc/thermald.conf

# EGL Config
PRODUCT_COPY_FILES += \
        device/lge/geeb_att_full/configs/egl.cfg:system/lib/egl/egl.cfg

# Media
PRODUCT_COPY_FILES += \
	device/lge/geeb_att_full/configs/media_profiles.xml:system/etc/media_profiles.xml \
	device/lge/geeb_att_full/configs/media_codecs.xml:system/etc/media_codecs.xml 

# Non-Ramdisk Init Scripts
PRODUCT_COPY_FILES += \
	device/lge/geeb_att_full/scripts/kickstart_checker.sh:system/etc/kickstart_checker.sh \
        device/lge/geeb_att_full/scripts/init.gee.bt.sh:system/etc/init.gee.bt.sh \
	device/lge/geeb_att_full/scripts/init.qcom.mdm_links.sh:system/etc/init.qcom.mdm_links.sh \
 	device/lge/geeb_att_full/scripts/init.qcom.modem_links.sh:system/etc/init.qcom.modem_links.sh \
	device/lge/geeb_att_full/scripts/efsbackup.sh:system/bin/efsbackup.sh

# Keylayouts
PRODUCT_COPY_FILES += \
	device/lge/geeb_att_full/keylayouts/Button_Jack.kl:system/usr/keylayout/Button_Jack.kl \
	device/lge/geeb_att_full/keylayouts/external_kbd.kl:system/usr/keylayout/external_kbd.kl \
	device/lge/geeb_att_full/keylayouts/keypad_8064.kl:system/usr/keylayout/keypad_8064.kl \
	device/lge/geeb_att_full/keylayouts/MHLRCP.kl:system/usr/keylayout/MHLRCP.kl \
	device/lge/geeb_att_full/keylayouts/osp3-input.kl:system/usr/keylayout/osp3-input.kl 

# Input calibration
PRODUCT_COPY_FILES += \
        device/lge/geeb_att_full/input/touch_dev.idc:system/usr/idc/touch_dev.idc \
	device/lge/geeb_att_full/input/osp3-input.idc:system/usr/idc/osp3-input.idc

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
	frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
	frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
	frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
	frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
	frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
	frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml

# Vold configuration
PRODUCT_COPY_FILES += \
    device/lge/geeb_att_full/vold.fstab:system/etc/vold.fstab

# GPS configuration
PRODUCT_COPY_FILES += \
        device/lge/geeb_att_full/configs/gps.conf:system/etc/gps.conf

# NFC packages
PRODUCT_PACKAGES += \
    libnfc \
    libnfc_jni \
    Nfc \
    Tag \
    com.android.nfc_extras

# NFCEE access control
ifeq ($(TARGET_BUILD_VARIANT),user)
    NFCEE_ACCESS_PATH := device/lge/geeb_att_full/nfc/nfcee_access.xml
else
    NFCEE_ACCESS_PATH := device/lge/geeb_att_full/nfc/nfcee_access_debug.xml
endif

# Commands to migrate prefs from com.android.nfc3 to com.android.nfc
PRODUCT_COPY_FILES += \
        packages/apps/Nfc/migrate_nfc.txt:system/etc/updatecmds/migrate_nfc.txt

# NFC access control + feature files + configuration
PRODUCT_COPY_FILES += \
    $(NFCEE_ACCESS_PATH):system/etc/nfcee_access.xml \
    frameworks/native/data/etc/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/com.nxp.mifare.xml:system/etc/permissions/com.nxp.mifare.xml

# Script for baseband name resolution
# PRODUCT_COPY_FILES += \
#    $(LOCAL_PATH)/fetch-swv:system/bin/fetch-swv

PRODUCT_PROPERTY_OVERRIDES += \
	ro.opengles.version=131072

PRODUCT_PROPERTY_OVERRIDES += \
	ro.sf.lcd_density=320
	gsm.version.baseband=APQ8064/MDM9x15M

# Audio Configuration
PRODUCT_PROPERTY_OVERRIDES += \
	persist.audio.handset.mic=dmic \
	persist.audio.fluence.mode=endfire \
        persist.audio.lowlatency.rec=false \
	af.resampler.quality=4

# Do not power down SIM card when modem is sent to Low Power Mode.
PRODUCT_PROPERTY_OVERRIDES += \
    persist.radio.apm_sim_not_pwdn=1

# Ril sends only one RIL_UNSOL_CALL_RING, so set call_ring.multiple to false
PRODUCT_PROPERTY_OVERRIDES += \
	ro.telephony.call_ring.multiple=0

# QC RIL path for rild
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    rild.libpath=/system/lib/libril-qc-qmi-1.so 

#Upto 3 layers can go through overlays
PRODUCT_PROPERTY_OVERRIDES += persist.hwc.mdpcomp.enable=true

PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_PACKAGES += \
	librs_jni \
	com.android.future.usb.accessory

# Filesystem management tools
PRODUCT_PACKAGES += \
	e2fsck

PRODUCT_PACKAGES += \
	libgenlock \
	liboverlay \
	hwcomposer.msm8960 \
	gralloc.msm8960 \
	copybit.msm8960

PRODUCT_PACKAGES += \
	alsa.msm8960 \
	audio_policy.msm8064 \
	audio.primary.msm8960 \
	audio.a2dp.default \
	audio.usb.default \
	audio.r_submix.default \
	libaudio-resampler


PRODUCT_PACKAGES += \
	hci_qcomm_init

PRODUCT_PACKAGES += \
	power.msm8960

PRODUCT_PROPERTY_OVERRIDES += \
	ro.qualcomm.bt.hci_transport=smd

# CameraHAL
PRODUCT_PACKAGES += \
	camera.geeb_att_full \
	libmmcamera_interface2 \
	libmmcamera_interface

PRODUCT_PACKAGES += \
        libmm-omxcore \
	libdivxdrmdecrypt \
	libOmxVdec \
	libOmxVenc \
	libOmxCore \
	libstagefrighthw \
	libc2dcolorconvert

PRODUCT_PACKAGES += \
	libloc_adapter \
	libloc_eng \
	libloc_api_v02 \
	libgps.utils \
	gps.msm8960

PRODUCT_PACKAGES += \
	bdAddrLoader \
	libwfcu \
	conn_init

PRODUCT_PROPERTY_OVERRIDES += \
	drm.service.enabled=true

PRODUCT_PROPERTY_OVERRIDES += \
	wifi.interface=wlan0 \
	wifi.supplicant_scan_interval=60 \
	persist.radio.kickstart=on

# Telephony Properties
PRODUCT_PROPERTY_OVERRIDES += \
    telephony.lteOnCdmaDevice=0 \
    telephony.lteOnGsmDevice=1 \
    ro.telephony.default_network=9 \
    ro.ril.def.preferred.network=9

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
   frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

# Enable for debugging
PRODUCT_PROPERTY_OVERRIDES += \
    ro.debuggable=1 \
    persist.service.adb.enable=1

# Enable AAC 5.1 output
PRODUCT_PROPERTY_OVERRIDES += \
        media.aac_51_output_enabled=true

PRODUCT_PROPERTY_OVERRIDES += \
	debug.prerotation.disable=1

PRODUCT_PROPERTY_OVERRIDES += \
        debug.egl.recordable.rgba8888=1

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	persist.sys.usb.config=mtp

$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)
