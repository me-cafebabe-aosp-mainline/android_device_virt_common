#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# AAPT
PRODUCT_AAPT_PREF_CONFIG := mdpi

# APEX
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Console
$(call inherit-product, device/generic/shared/features/first_stage_console/first_stage_console.mk)
$(call inherit-product, device/generic/shared/features/serial_console_as_root/serial_console_as_root.mk)

# Dalvik heap
$(call inherit-product, frameworks/native/build/tablet-10in-xhdpi-2048-dalvik-heap.mk)

# Dynamic partitions
PRODUCT_BUILD_SUPER_PARTITION := true
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Fastbootd
PRODUCT_PACKAGES += \
    fastbootd

# Gatekeeper
$(call inherit-product, device/generic/shared/hardware/gatekeeper/software/gatekeeper_software.mk)

# Health
$(call inherit-product, device/generic/shared/hardware/health/cuttlefish/health_cuttlefish.mk)

# Init
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/config/fstab.virt:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.virt \
    $(LOCAL_PATH)/config/init.vendor.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.virt.rc \
    $(LOCAL_PATH)/config/ueventd.rc:$(TARGET_COPY_OUT_VENDOR)/etc/ueventd.rc

# Images
PRODUCT_BUILD_RAMDISK_IMAGE := true
PRODUCT_BUILD_RECOVERY_IMAGE := true
PRODUCT_BUILD_USERDATA_IMAGE := true
PRODUCT_BUILD_VENDOR_RAMDISK_IMAGE := true

# Keymint
PRODUCT_PACKAGES += \
    android.hardware.security.keymint-service

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay

# Permissions (Misc)
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.ethernet.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.ethernet.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.software.ipsec_tunnels.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.ipsec_tunnels.xml \
    frameworks/native/data/etc/android.software.midi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.midi.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/handheld_core_hardware.xml

# Properties
include $(wildcard $(LOCAL_PATH)/properties/*.mk)

# Ramdisk
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/config/fstab.virt:$(TARGET_COPY_OUT_VENDOR_RAMDISK)/first_stage_ramdisk/fstab.virt

# Recovery
$(call inherit-product, device/generic/shared/features/recovery_ethernet_dhcp/recovery_ethernet_dhcp.mk)

PRODUCT_COPY_FILES += \
    device/google/cuttlefish/shared/config/cgroups.json:$(TARGET_COPY_OUT_RECOVERY)/root/vendor/etc/cgroups.json

# Scoped Storage
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Shipping API level
PRODUCT_SHIPPING_API_LEVEL := 34

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# SPL
include device/generic/shared/misc/vendor_spl_match_platform.mk

# Suspend blocker
$(call inherit-product, device/generic/shared/components/suspend_blocker/suspend_blocker.mk)

# Userspace reboot
$(call inherit-product, $(SRC_TARGET_DIR)/product/userspace_reboot.mk)

# Window Extensions
$(call inherit-product, $(SRC_TARGET_DIR)/product/window_extensions.mk)
