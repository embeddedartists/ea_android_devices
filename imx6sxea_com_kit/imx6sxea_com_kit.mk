$(call inherit-product, device/embeddedartists/imx6sxea_com_kit/imx6.mk)
$(call inherit-product-if-exists,vendor/google/products/gms.mk)

# Overrides
PRODUCT_NAME := imx6sxea_com_kit
PRODUCT_DEVICE := imx6sxea_com_kit
PRODUCT_BRAND := embeddedartists
PRODUCT_MANUFACTURER := embeddedartists

PRODUCT_COPY_FILES += \
	device/embeddedartists/imx6sxea_com_kit/init.rc:root/init.freescale.rc \
	device/embeddedartists/imx6sxea_com_kit/fstab.freescale:root/fstab.freescale \
	device/embeddedartists/imx6sxea_com_kit/ar1021_I2C_Touchscreen.idc:system/usr/idc/ar1021_I2C_Touchscreen.idc

# Audio
PRODUCT_COPY_FILES += \
	device/embeddedartists/imx6sxea_com_kit/audio_policy.conf:system/etc/audio_policy.conf \
	device/embeddedartists/imx6sxea_com_kit/audio_effects.conf:system/vendor/etc/audio_effects.conf

# setup dm-verity configs.
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
	device/embeddedartists/imx6sxea_com_kit/required_hardware.xml:system/etc/permissions/required_hardware.xml

PRODUCT_COPY_FILES += \
    device/fsl-proprietary/gpu-viv/lib/egl/egl.cfg:system/lib/egl/egl.cfg

PRODUCT_PACKAGES += \
    libEGL_VIVANTE \
    libGLESv1_CM_VIVANTE \
    libGLESv2_VIVANTE \
    gralloc_viv.imx6 \
    hwcomposer_viv.imx6 \
    hwcomposer_fsl.imx6 \
    libGAL \
    libGLSLC \
    libVSC \
    libg2d \
    libgpuhelper


