ifeq ($(WITH_GAPPS),true)
$(call inherit-product-if-exists, vendor/gms/products/gms.mk)

# Common Overlay
DEVICE_PACKAGE_OVERLAYS += \
    vendor/aosp/overlay-gapps/common

# Exclude RRO Enforcement
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS +=  \
    vendor/aosp/overlay-gapps/common

# Dex preopt
PRODUCT_DEXPREOPT_SPEED_APPS += \
    NexusLauncherRelease

endif
