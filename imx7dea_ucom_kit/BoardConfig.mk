#
# Product-specific compile-time definitions.
#

include device/fsl/imx7/soc/imx7d.mk
export BUILD_ID=1.0.0
export BUILD_NUMBER=20160509
include device/embeddedartists/imx7dea_ucom_kit/BoardConfigCommon.mk

#TARGET_NO_RECOVERY := true

-include device/fsl-proprietary/gpu-viv/fsl-gpu.mk
# sabresd_mx7d default target for EXT4
BUILD_TARGET_FS ?= ext4
include device/fsl/imx7/imx7_target_fs.mk

TARGET_RECOVERY_FSTAB = device/embeddedartists/imx7dea_ucom_kit/fstab.freescale
# build for ext4
PRODUCT_COPY_FILES +=	\
	device/embeddedartists/imx7dea_ucom_kit/fstab.freescale:root/fstab.freescale

TARGET_BOOTLOADER_BOARD_NAME := IMX7DEA_UCOM_KIT
PRODUCT_MODEL := IMX7DEA_UCOM_KIT

TARGET_RELEASETOOLS_EXTENSIONS := device/fsl/imx7

#
# WLAN settings. Realtek RTL8188CUS chipset tested and supported
# D-Link N 150 Micro USB Adapter (DWA-121) has been used
#

BOARD_HAVE_WIFI                  := true
EA_BOARD_IGNORE_NL80211_CMD := true

WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211

BOARD_WPA_SUPPLICANT_PRIVATE_LIB_RTL := lib_driver_cmd_rtl
BOARD_WLAN_DEVICE                := REALTEK

BOARD_SUPPORT_BCM_WIFI := false

BOARD_MODEM_VENDOR := AMAZON

USE_ATHR_GPS_HARDWARE := false
USE_QEMU_GPS_HARDWARE := false

#for accelerator sensor, need to define sensor type here
BOARD_USE_SENSOR_FUSION := false
#SENSOR_MMA8451 := true

# for recovery service
TARGET_SELECT_KEY := 28
# we don't support sparse image.
TARGET_USERIMAGES_SPARSE_EXT_DISABLED := false
DM_VERITY_RUNTIME_CONFIG := true
# atheros 3k BT
BOARD_HAVE_BLUETOOTH_BCM := false
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/fsl/sabresd_7d/bluetooth

USE_ION_ALLOCATOR := false
USE_GPU_ALLOCATOR := true

# camera hal v2
IMX_CAMERA_HAL_V2 := false
TARGET_VSYNC_DIRECT_REFRESH := true

BOARD_KERNEL_CMDLINE := console=ttymxc0,115200 init=/init androidboot.console=ttymxc0 consoleblank=0 androidboot.hardware=freescale 
TARGET_BOOTLOADER_CONFIG := imx7d:mx7dea-ucom-android_config
TARGET_BOARD_DTS_CONFIG := imx7d:imx7dea-ucom-kit-lvds.dtb

TARGET_KERNEL_DEFCONF := imx6_ea_android_defconfig

BOARD_SEPOLICY_DIRS := \
       device/embeddedartists/imx7dea_ucom_kit/sepolicy
BOARD_SEPOLICY_UNION := \
       domain.te \
       system_app.te \
       system_server.te \
       untrusted_app.te \
       sensors.te \
       init_shell.te \
       kernel.te \
       mediaserver.te \
       file_contexts \
       genfs_contexts \
       fs_use \
       rild.te \
       init.te \
       netd.te \
       bootanim.te \
       dnsmasq.te \
       recovery.te \
       bluetooth.te \
       device.te
