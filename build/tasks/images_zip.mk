ifeq ($(USES_DEVICE_VIRT_COMMON),true)

INSTALLED_CMDLINE_TXT_TARGET := $(PRODUCT_OUT)/cmdline.txt
$(INSTALLED_CMDLINE_TXT_TARGET):
	rm -f $@
	$(foreach param, $(BOARD_KERNEL_CMDLINE), \
	printf "%s " $(param) >> $@;)

INSTALLED_IMAGES_ZIP_TARGET := $(PRODUCT_OUT)/$(TARGET_PRODUCT)-$(TARGET_BUILD_VARIANT)-images.zip
$(INSTALLED_IMAGES_ZIP_TARGET): $(INSTALLED_CMDLINE_TXT_TARGET) $(PRODUCT_OUT)/kernel $(PRODUCT_OUT)/ramdisk.img $(PRODUCT_OUT)/ramdisk-recovery.img $(PRODUCT_OUT)/super.img $(PRODUCT_OUT)/userdata.img
	$(call pretty,"Target images ZIP archive: $@")
	$(hide) zip -qjX $@ $^

.PHONY: images_zip
images_zip: $(INSTALLED_IMAGES_ZIP_TARGET)

endif
