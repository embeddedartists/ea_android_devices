#
# Product-specific compile-time definitions.
#

include device/fsl/imx6/soc/imx6dq.mk
export BUILD_ID=1.0.0
export BUILD_NUMBER=20170705
include device/embeddedartists/imx6qea_com_kit/BoardConfigCommon.mk

#AR include device/fsl-proprietary/gpu-viv/fsl-gpu.mk
# sabresd_6dq default target for EXT4
BUILD_TARGET_FS ?= ext4
include device/fsl/imx6/imx6_target_fs.mk

ADDITIONAL_BUILD_PROPERTIES += \
                        ro.internel.storage_size=/sys/block/mmcblk3/size \
                        ro.boot.storage_type=emmc \
                        ro.frp.pst=/dev/block/mmcblk3p12

TARGET_RECOVERY_FSTAB = device/embeddedartists/imx6qea_com_kit/fstab.freescale
# build for ext4
PRODUCT_COPY_FILES +=   \
        device/embeddedartists/imx6qea_com_kit/fstab.freescale:root/fstab.freescale


TARGET_BOOTLOADER_BOARD_NAME := IMX6QEA_COM_KIT
PRODUCT_MODEL := IMX6QEA_COM_KIT

TARGET_BOOTLOADER_POSTFIX := imx

TARGET_RELEASETOOLS_EXTENSIONS := device/fsl/imx6

#
# WLAN settings. Realtek RTL8188CUS chipset tested and supported
# D-Link N 150 Micro USB Adapter (DWA-121) has been used
#

BOARD_SUPPORT_BCM_WIFI  := false
BOARD_HAVE_WIFI                  := true
EA_BOARD_IGNORE_NL80211_CMD := true

WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211

BOARD_WPA_SUPPLICANT_PRIVATE_LIB_RTL := lib_driver_cmd_rtl
BOARD_WLAN_DEVICE                := REALTEK


USE_ATHR_GPS_HARDWARE := false
USE_QEMU_GPS_HARDWARE := false

#for accelerator sensor, need to define sensor type here
BOARD_HAS_SENSOR := false
SENSOR_MMA8451 := false

# for recovery service
TARGET_SELECT_KEY := 28

# we don't support sparse image.
TARGET_USERIMAGES_SPARSE_EXT_DISABLED := false
DM_VERITY_RUNTIME_CONFIG := true


ifeq ($(TARGET_USERIMAGES_USE_UBIFS),true)
UBI_ROOT_INI := device/fsl/sabresd_6sx/ubi/ubinize.ini
TARGET_MKUBIFS_ARGS := -m 4096 -e 516096 -c 4096 -x none
TARGET_UBIRAW_ARGS := -m 4096 -p 512KiB $(UBI_ROOT_INI)
endif

ifeq ($(TARGET_USERIMAGES_USE_UBIFS),true)
ifeq ($(TARGET_USERIMAGES_USE_EXT4),true)
$(error "TARGET_USERIMAGES_USE_UBIFS and TARGET_USERIMAGES_USE_EXT4 config open in same time, please only choose one target file system image")
endif
endif

BOARD_KERNEL_CMDLINE := console=ttymxc0,115200 init=/init video=mxcfb0:dev=ldb,bpp=32 video=mxcfb1:off video=mxcfb2:off video=mxcfb3:off vmalloc=128M androidboot.console=ttymxc0 consoleblank=0 androidboot.hardware=freescale cma=448M

ifeq ($(TARGET_USERIMAGES_USE_UBIFS),true)
#UBI boot command line.
# Note: this NAND partition table must align with MFGTool's config.
BOARD_KERNEL_CMDLINE +=  mtdparts=gpmi-nand:16m(bootloader),16m(bootimg),128m(recovery),-(root) gpmi_debug_init ubi.mtd=3
endif


BOARD_HAVE_BLUETOOTH_BCM := false

USE_ION_ALLOCATOR := false
USE_GPU_ALLOCATOR := true

# camera hal v2
IMX_CAMERA_HAL_V2 := false
TARGET_VSYNC_DIRECT_REFRESH := true

TARGET_BOOTLOADER_CONFIG := imx6q:mx6qea-com-android_config
TARGET_BOARD_DTS_CONFIG := imx6q:imx6qea-com-kit-lvds.dtb

TARGET_KERNEL_DEFCONF := ea_imx_android_defconfig

BOARD_SEPOLICY_DIRS := \
       device/embeddedartists/imx6qea_com_kit/sepolicy

#AR BOARD_SEPOLICY_UNION := \
#AR        domain.te \
#AR        system_app.te \
#AR        system_server.te \
#AR        untrusted_app.te \
#AR        sensors.te \
#AR        init_shell.te \
#AR        bluetooth.te \
#AR        kernel.te \
#AR        mediaserver.te \
#AR        file_contexts \
#AR        genfs_contexts \
#AR        fs_use  \
#AR        rild.te \
#AR        init.te \
#AR        netd.te \
#AR        bootanim.te \
#AR        dnsmasq.te \
#AR        recovery.te \
#AR        device.te \
#AR        zygote.te

TARGET_BOARD_KERNEL_HEADERS := device/fsl/common/kernel-headers
