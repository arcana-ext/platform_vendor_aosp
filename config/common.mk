# Copyright (C) 2021 ProjectArcana
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

# Gapps
$(call inherit-product, vendor/aosp/config/gapps.mk)

ifeq ($(ARCANA_OFFICIAL),true)
$(call inherit-product, vendor/aosp/config/themes.mk)
endif

include vendor/aosp/config/version.mk

# Audio files
$(call inherit-product, vendor/aosp/config/google_audio.mk)

# Font config template
PRODUCT_COPY_FILES += \
    vendor/aosp/prebuilt/common/etc/custom_font_config.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/custom_font_config.xml

ifneq ($(WITH_GAPPS),true)
include vendor/lawnchair/lawnchair.mk
PREBUILT_LAUNCHER ?= LAWNCHAIR
endif

ifeq ($(WITH_GAPPS),true)
ifeq ($(PREBUILT_LAWNCHAIR),true)
include vendor/lawnchair/lawnchair.mk
PREBUILT_LAUNCHER ?= LAWNCHAIR
else
PREBUILT_LAUNCHER ?= PIXEL
endif
endif

ifneq ($(PREBUILT_LAWNCHAIR),true)
PRODUCT_PACKAGES += \
    ThemedIconsOverlay
endif

# Conditionally build adb root
#ifneq ($(TARGET_BUILD_VARIANT),user)
#PRODUCT_PACKAGES += \
#    adb_root
#endif

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/aosp/prebuilt/common/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/aosp/prebuilt/common/bin/backuptool.functions:install/bin/backuptool.functions \
    vendor/aosp/prebuilt/common/bin/50-base.sh:$(TARGET_COPY_OUT_SYSTEM)/addon.d/50-base.sh

ifneq ($(strip $(AB_OTA_PARTITIONS) $(AB_OTA_POSTINSTALL_CONFIG)),)
PRODUCT_COPY_FILES += \
    vendor/aosp/prebuilt/common/bin/backuptool_ab.sh:$(TARGET_COPY_OUT_SYSTEM)/bin/backuptool_ab.sh \
    vendor/aosp/prebuilt/common/bin/backuptool_ab.functions:$(TARGET_COPY_OUT_SYSTEM)/bin/backuptool_ab.functions \
    vendor/aosp/prebuilt/common/bin/backuptool_postinstall.sh:$(TARGET_COPY_OUT_SYSTEM)/bin/backuptool_postinstall.sh
endif

# Bootanimation
$(call inherit-product, vendor/aosp/config/bootanimation.mk)

# Common Overlay
PRODUCT_PACKAGE_OVERLAYS += \
    vendor/aosp/overlay/common

# Exclude RRO Enforcement
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS +=  \
    vendor/aosp/overlay/common

# Enable one-handed mode
PRODUCT_PRODUCT_PROPERTIES += \
    ro.support_one_handed_mode=true

# Face Unlock
TARGET_FACE_UNLOCK_SUPPORTED ?= true
ifeq ($(TARGET_FACE_UNLOCK_SUPPORTED),true)
PRODUCT_PACKAGES += \
    FaceUnlockService
PRODUCT_SYSTEM_PROPERTIES += \
    ro.face_unlock_service.enabled=$(TARGET_FACE_UNLOCK_SUPPORTED)
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.biometrics.face.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.biometrics.face.xml
endif

# Enforce privapp-permissions whitelist
PRODUCT_SYSTEM_PROPERTIES += \
    ro.control_privapp_permissions=log

PRODUCT_PACKAGES += \
    Terminal \
    LatinIME \
    LiveWallpapers \
    LiveWallpapersPicker \
    Lawnchair \
    VisualizationWallpapers \
    librs_jni \
    Stk \
    GamingMode \
    Retro \
    Via \
    DevicePersonalizationPrebuiltPixel2021

ifeq ($(ARCANA_OFFICIAL),true)
PRODUCT_PACKAGES += \
    OPWidget \
    Arcanery
endif

ifeq ($(ARCANA_OFFICIAL),true)
# Repainter integration
PRODUCT_PACKAGES += \
    RepainterServicePriv
endif

TARGET_BUILD_GRAPHENEOS_CAMERA ?= false
ifeq ($(strip $(TARGET_BUILD_GRAPHENEOS_CAMERA)),true)
PRODUCT_PACKAGES += \
    GrapheneCamera
endif

# SystemUI plugins
PRODUCT_PACKAGES += \
    QuickAccessWallet

# SimpleDeviceConfig
PRODUCT_PACKAGES += \
    SimpleDeviceConfig

# Cutout control overlays
#PRODUCT_PACKAGES += \
#    HideCutout \
#    StatusBarStock

PRODUCT_PACKAGES += \
    NoCutoutOverlay \
    AvoidAppsInCutoutOverlay

# Dex preopt
PRODUCT_DEXPREOPT_SPEED_APPS += \
    Lawnchair  \
    Settings \
    SystemUI

# Extra packages
PRODUCT_PACKAGES += \
    libjni_latinimegoogle

# Immersive Navigation
#PRODUCT_PACKAGES += \
#    ImmersiveNavigationOverlay

TARGET_SUPPORTS_QUICK_TAP ?= true

ifneq ($(WITH_GAPPS),true)
# Pixel sysconfig
PRODUCT_COPY_FILES += \
    vendor/aosp/prebuilt/common/etc/sysconfig/pixel.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/pixel.xml \
    vendor/aosp/prebuilt/common/etc/permissions/product/privapp-permissions-product-google.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-product-google.xml \
    vendor/aosp/prebuilt/common/etc/permissions/system/privapp-permissions-google-system.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-google-system.xml
endif

# priv-app permissions
PRODUCT_COPY_FILES += \
    vendor/aosp/prebuilt/common/etc/permissions/system/privapp-permissions-arcana.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-arcana.xml \
    vendor/aosp/prebuilt/common/etc/permissions/system/privapp-permissions-qti.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/privapp-permissions-qti.xml \
    vendor/aosp/prebuilt/common/etc/permissions/product/privapp-permissions-arcana.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-arcana.xml \
    vendor/aosp/prebuilt/common/etc/permissions/product/privapp-permissions-soundrecorder.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-soundrecorder.xml
    
# Pixel sysconfig from Pixel XL (Photos)
PRODUCT_COPY_FILES += \
    vendor/aosp/prebuilt/common/etc/sysconfig/pixel_2016_exclusive.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/pixel_2016_exclusive.xml \

# Extra tools
PRODUCT_PACKAGES += \
    e2fsck \
    tune2fs \
    mount.exfat \
    fsck.exfat \
    mkfs.exfat \
    mkfs.f2fs \
    fsck.f2fs \
    fibmap.f2fs \
    7z \
    bash \
    bzip2 \
    curl \
    lib7z \
    powertop \
    pigz \
    tinymix \
    unrar \
    unzip \
    vim \
    rsync \
    zip

# Exchange support
PRODUCT_PACKAGES += \
    Exchange2

# Overlays
PRODUCT_PACKAGES += \
    CustomConfigOverlay \
    CustomLauncherOverlay \
    CustomSettingsOverlay

# Backup Services whitelist
PRODUCT_COPY_FILES += \
    vendor/aosp/config/permissions/backup.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysconfig/backup.xml

# font permission
PRODUCT_COPY_FILES += \
    vendor/aosp/config/permissions/privapp-permissions-settings.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/privapp-permissions-settings.xml
	
# SoftAPManager
#PRODUCT_PACKAGES += \
#    SoftAPManager

# init.d support
PRODUCT_COPY_FILES += \
    vendor/aosp/prebuilt/common/etc/init.d/00banner:$(TARGET_COPY_OUT_SYSTEM)/etc/init.d/00banner

# Arcana-specific init files
PRODUCT_COPY_FILES += \
    vendor/aosp/prebuilt/common/etc/init/init.arcana-updates.rc:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/init/init.arcana-updates.rc \
    vendor/aosp/prebuilt/common/etc/init/init.openssh.rc:$(TARGET_COPY_OUT_PRODUCT)/etc/init/init.openssh.rc

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/android.software.sip.voip.xml

# Enable wireless Xbox 360 controller support
PRODUCT_COPY_FILES += \
    frameworks/base/data/keyboards/Vendor_045e_Product_028e.kl:$(TARGET_COPY_OUT_PRODUCT)/usr/keylayout/Vendor_045e_Product_0719.kl

# Media
PRODUCT_SYSTEM_PROPERTIES += \
    media.recorder.show_manufacturer_and_model=true

# Arcana maintainer
PRODUCT_PRODUCT_PROPERTIES += \
    ro.arcana.maintainer=$(ARCANA_MAINTAINER) \
    ro.arcana.code=$(ARCANA_CODE)
    
# Needed by some RILs and for some gApps packages
PRODUCT_PACKAGES += \
    librsjni \
    libprotobuf-cpp-full

# Charger images
PRODUCT_PACKAGES += \
    charger_res_images

# Pixel charger images
ifeq ($(USE_PIXEL_CHARGER_IMAGES),true)
PRODUCT_PACKAGES += \
    product_charger_res_images
endif

# StichImage
#PRODUCT_PACKAGES += \
#    StitchImage

# ThemeOverlays
include packages/overlays/Themes/themes.mk

TARGET_SUPPORTS_BLUR ?= false
# Enable blurs based on targets
ifeq ($(TARGET_SUPPORTS_BLUR),true)
PRODUCT_VENDOR_PROPERTIES += \
    ro.surface_flinger.supports_background_blur=1 \
    ro.sf.blurs_are_expensive=1
    persist.sysui.disableBlur=false
endif

# UDFPS Animations
EXTRA_UDFPS_ANIMATIONS ?= false
ifeq ($(EXTRA_UDFPS_ANIMATIONS),true)
PRODUCT_PACKAGES += \
    UdfpsResources
endif

# Disable async MTE on system_server
PRODUCT_SYSTEM_EXT_PROPERTIES += \
    arm64.memtag.process.system_server=off
    
# Enable IORap I/O Prefetching
PRODUCT_SYSTEM_PROPERTIES += \
    persist.device_config.runtime_native_boot.iorap_perfetto_enable=true

# Disable blur on app-launch
PRODUCT_SYSTEM_EXT_PROPERTIES += \
    ro.launcher.blur.appLaunch=false
    
# Fling Sysprops
PRODUCT_SYSTEM_PROPERTIES += \
    ro.min.fling_velocity=50 \
    ro.max.fling_velocity=16000

# Disable Deep Press touch video heatmaps 
PRODUCT_SYSTEM_PROPERTIES += \
    ro.input.video_enabled=false
    
# Gboard
PRODUCT_PRODUCT_PROPERTIES += \
    ro.com.google.ime.kb_pad_port_b?=1

# Gboard side padding (OOS)
PRODUCT_PRODUCT_PROPERTIES += \
    ro.com.google.ime.kb_pad_port_l?=7 \
    ro.com.google.ime.kb_pad_port_r?=7 \
    ro.com.google.ime.kb_pad_land_l?=14 \
    ro.com.google.ime.kb_pad_land_r?=14

# Don't compile SystemUITests
EXCLUDE_SYSTEMUI_TESTS := true

# Don't preopt prebuilts
DONT_DEXPREOPT_PREBUILTS := true

# Recommend using the non debug dexpreopter
USE_DEX2OAT_DEBUG := false
# Don't build debug for host or device
PRODUCT_ART_TARGET_INCLUDE_DEBUG_BUILD := false
ART_BUILD_TARGET_NDEBUG := true
ART_BUILD_TARGET_DEBUG := false
ART_BUILD_HOST_NDEBUG := true
ART_BUILD_HOST_DEBUG := false
# Strip the local variable table and the local variable type table to reduce
# the size of the system image. This has no bearing on stack traces, but will
# leave less information available via JDWP.
PRODUCT_MINIMIZE_JAVA_DEBUG_INFO := true

ifeq ($(ENFORCE_COMP_MATRIX_FILE),true)
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += vendor/aosp/config/device_framework_matrix.xml
endif

