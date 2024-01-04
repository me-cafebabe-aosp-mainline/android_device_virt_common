#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

USES_DEVICE_VIRT_COMMON := true
COMMON_PATH := device/virt/common

# Bootloader
TARGET_NO_BOOTLOADER := true

# Display
TARGET_SCREEN_DENSITY := 160

# Filesystem
BOARD_EXT4_SHARE_DUP_BLOCKS :=
TARGET_USERIMAGES_USE_F2FS := true
TARGET_USERIMAGES_USE_EXT4 := true

# Kernel
include device/generic/shared/board_config/cmdline/common.mk
BOARD_EXCLUDE_KERNEL_FROM_RECOVERY_IMAGE := true
BOARD_KERNEL_CMDLINE += \
    androidboot.boot_devices=any \
    androidboot.fstab_suffix=virt \
    androidboot.selinux=permissive \
    androidboot.verifiedbootstate=orange
TARGET_NO_KERNEL ?= true

# OTA
TARGET_SKIP_OTA_PACKAGE := true

# Partitions
BOARD_SUPER_PARTITION_SIZE := 4294967296 # 4 GB
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs
BOARD_USERDATAIMAGE_PARTITION_SIZE := 34359738368 # 32 GB
BOARD_USES_METADATA_PARTITION := true

DLKM_PARTITIONS := system_dlkm vendor_dlkm
SSI_PARTITIONS := product system system_ext
TREBLE_PARTITIONS := odm vendor
ALL_PARTITIONS := $(DLKM_PARTITIONS) $(SSI_PARTITIONS) $(TREBLE_PARTITIONS)

BOARD_SUPER_PARTITION_GROUPS := virt_dynamic_partitions
BOARD_VIRT_DYNAMIC_PARTITIONS_PARTITION_LIST := $(ALL_PARTITIONS)
BOARD_VIRT_DYNAMIC_PARTITIONS_SIZE := $(shell expr $(BOARD_SUPER_PARTITION_SIZE) - 4194304 )

$(foreach p, $(call to-upper, $(ALL_PARTITIONS)), \
    $(eval BOARD_$(p)IMAGE_FILE_SYSTEM_TYPE := ext4) \
    $(eval TARGET_COPY_OUT_$(p) := $(call to-lower, $(p))))

include device/generic/shared/board_config/dynamic_partitions/inode_count.mk
include device/generic/shared/board_config/dynamic_partitions/reserved_size/small.mk

# Ramdisk
BOARD_COMBINE_RAMDISK_IMAGES := true
BOARD_RAMDISK_USE_LZ4 := true

# Recovery
TARGET_RECOVERY_FSTAB := $(COMMON_PATH)/config/fstab.virt
TARGET_RECOVERY_PIXEL_FORMAT ?= ABGR_8888

# RIL
ENABLE_VENDOR_RIL_SERVICE := true

# SELinux
BOARD_VENDOR_SEPOLICY_DIRS += \
    $(COMMON_PATH)/sepolicy/vendor \
    device/generic/shared/components/dhcpclient/sepolicy/vendor
