$(call inherit-product, device/fsl/imx6/imx6.mk)
$(call inherit-product-if-exists,vendor/google/products/gms.mk)

# Overrides
PRODUCT_NAME := imx6sxea_com_kit
PRODUCT_DEVICE := imx6sxea_com_kit
PRODUCT_BRAND := embeddedartists
PRODUCT_MANUFACTURER := embeddedartists

PRODUCT_COPY_FILES += \
	device/embeddedartists/imx6sxea_com_kit/init.rc:root/init.freescale.rc \
	device/embeddedartists/imx6sxea_com_kit/fstab.freescale:root/fstab.freescale \
	device/embeddedartists/imx6sxea_com_kit/required_hardware.xml:system/etc/permissions/required_hardware.xml \
	device/embeddedartists/imx6sxea_com_kit/audio_policy.conf:system/etc/audio_policy.conf \
	device/embeddedartists/imx6sxea_com_kit/audio_effects.conf:system/vendor/etc/audio_effects.conf \
	device/embeddedartists/imx6sxea_com_kit/ar1021_I2C_Touchscreen.idc:system/usr/idc/ar1021_I2C_Touchscreen.idc


PRODUCT_SYSTEM_VERITY_PARTITION := /dev/block/mmcblk2p5
$(call inherit-product, build/target/product/verity.mk)

DEVICE_PACKAGE_OVERLAYS := device/embeddedartists/imx6sxea_com_kit/overlay

PRODUCT_CHARACTERISTICS := tablet

PRODUCT_AAPT_CONFIG += xlarge large tvdpi hdpi

PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	frameworks/native/data/etc/android.hardware.ethernet.xml:system/etc/permissions/android.hardware.ethernet.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
                                
