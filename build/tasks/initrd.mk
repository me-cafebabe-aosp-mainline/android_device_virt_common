ifeq ($(USES_DEVICE_VIRT_COMMON),true)

INSTALLED_INITRD_TARGET := $(PRODUCT_OUT)/initrd.img
$(INSTALLED_INITRD_TARGET): $(PRODUCT_OUT)/ramdisk.img $(PRODUCT_OUT)/vendor_ramdisk.img
	cat $^ > $@

ALL_DEFAULT_INSTALLED_MODULES += $(INSTALLED_INITRD_TARGET)

.PHONY: initrd
initrd: $(INSTALLED_INITRD_TARGET)

INSTALLED_INITRD_RECOVERY_TARGET := $(PRODUCT_OUT)/initrd-recovery.img
$(INSTALLED_INITRD_RECOVERY_TARGET): $(PRODUCT_OUT)/ramdisk-recovery.img $(PRODUCT_OUT)/vendor_ramdisk.img
	cat $^ > $@

ALL_DEFAULT_INSTALLED_MODULES += $(INSTALLED_INITRD_RECOVERY_TARGET)

.PHONY: initrd-recovery
initrd-recovery: $(INSTALLED_INITRD_RECOVERY_TARGET)

endif