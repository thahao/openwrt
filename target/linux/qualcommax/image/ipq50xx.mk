DEVICE_VARS += BOOT_SCRIPT

define Device/glinet_gl-b3000
	$(call Device/FitImage)
	DEVICE_VENDOR := GL.iNet
	DEVICE_MODEL := GL-B3000
	SOC := ipq5018
	KERNEL_LOADADDR := 0x41080000
	KERNEL_IN_UBI := 1
	BLOCKSIZE := 128k
	PAGESIZE := 2048
	NAND_SIZE := 128m
	DEVICE_DTS_CONFIG := config@mp03.5-c1
	SUPPORTED_DEVICES += b3000
	BOOT_SCRIPT:= glinet_gl-b3000.bootscript
	IMAGES := factory.img sysupgrade.bin
	IMAGE/factory.img := append-ubi | gl-qsdk-factory | append-metadata
	DEVICE_PACKAGES := \
		ath11k-firmware-qcn6122 \
		ipq-wifi-glinet_gl-b3000 \
		dumpimage
endef
TARGET_DEVICES += glinet_gl-b3000

define Device/linksys_ipq50xx_mx_base
	$(call Device/FitImageLzma)
	DEVICE_VENDOR := Linksys
	BLOCKSIZE := 128k
	PAGESIZE := 2048
	KERNEL_SIZE := 8192k
	IMAGE_SIZE := 83968k
	NAND_SIZE := 256m
	SOC := ipq5018
	IMAGES += factory.bin
	IMAGE/factory.bin := append-kernel | pad-to $$$$(KERNEL_SIZE) | append-ubi | linksys-image type=$$$$(DEVICE_MODEL)
endef

define Device/linksys_mr5500
	$(call Device/linksys_ipq50xx_mx_base)
	DEVICE_MODEL := MR5500
	DEVICE_DTS_CONFIG := config@mp03.1
	DEVICE_PACKAGES := kmod-ath11k-pci \
		ath11k-firmware-qcn9074 \
		ipq-wifi-linksys_mr5500 \
		kmod-usb-ledtrig-usbport
endef
TARGET_DEVICES += linksys_mr5500

define Device/linksys_mx2000
	$(call Device/linksys_ipq50xx_mx_base)
	DEVICE_MODEL := MX2000
	DEVICE_DTS_CONFIG := config@mp03.5-c1
	DEVICE_PACKAGES := ath11k-firmware-qcn6122 \
		ipq-wifi-linksys_mx2000
endef
TARGET_DEVICES += linksys_mx2000

define Device/linksys_mx5500
	$(call Device/linksys_ipq50xx_mx_base)
	DEVICE_MODEL := MX5500
	DEVICE_DTS_CONFIG := config@mp03.1
	DEVICE_PACKAGES := kmod-ath11k-pci \
		ath11k-firmware-qcn9074 \
		ipq-wifi-linksys_mx5500
endef
TARGET_DEVICES += linksys_mx5500

define Device/linksys_spnmx56
	$(call Device/linksys_ipq50xx_mx_base)
	DEVICE_MODEL := SPNMX56
	DEVICE_DTS_CONFIG := config@mp03.1
	DEVICE_PACKAGES := kmod-ath11k-pci \
		ath11k-firmware-qcn9074 \
		ipq-wifi-linksys_spnmx56
endef
TARGET_DEVICES += linksys_spnmx56
