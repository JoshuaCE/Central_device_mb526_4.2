# Inherit device configuration
$(call inherit-product, device/moto/mb526/full_jordan.mk)

# Boot animation
TARGET_SCREEN_HEIGHT := 854
TARGET_SCREEN_WIDTH := 480

# Release name
PRODUCT_RELEASE_NAME := Defy(+)

UTC_DATE := $(shell date +%s)
DATE := $(shell date +%Y%m%d)

# Inherit some common slim stuff.
$(call inherit-product, vendor/slim/config/common_full_phone.mk)

## Specify phone tech before including full_phone
$(call inherit-product, vendor/slim/config/gsm.mk)

# Inherit device settings
$(call inherit-product, device/moto/mb526/config/common_defy.mk)
$(call inherit-product, vendor/slim/config/common_ledflash.mk)

#copy 00check
PRODUCT_COPY_FILES += \
    vendor/slim/prebuilt/common/etc/init.d/00check:system/etc/init.d/00check

#Hardware info
PRODUCT_PROPERTY_OVERRIDES += \
ro.device.chipset=TI OMAP 3630 \
ro.device.cpu=1 GHz Cortex-A8 single-core \
ro.device.gpu=PowerVRSGX530 \
ro.device.rear_cam=5MP \
ro.device.front_cam=N/A \
ro.device.screen_res=480x854

# Goo.im stuff
PRODUCT_PROPERTY_OVERRIDES += \
    ro.goo.developerid=Kayant \
    ro.goo.board=$(TARGET_PRODUCT)

ifdef SLIM_NIGHTLY
    PRODUCT_PROPERTY_OVERRIDES += \
        ro.goo.rom=Kayant \
        ro.slim.version=Slim-$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR).$(PRODUCT_VERSION_MAINTENANCE)-NIGHTLY-$(shell date +%m%d%Y) \
        ro.modversion=Slim-$(PRODUCT_RELEASE_NAME)-$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR).$(PRODUCT_VERSION_MAINTENANCE)-NIGHTLY-$(shell date +%m%d%Y)
else
ifdef SLIM_RELEASE
        PRODUCT_PROPERTY_OVERRIDES += \
            ro.goo.rom=Kayant \
            ro.slim.version=Slim-$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR).$(PRODUCT_VERSION_MAINTENANCE)-OFFICIAL \
            ro.modversion=Slim-$(PRODUCT_RELEASE_NAME)-$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR).$(PRODUCT_VERSION_MAINTENANCE)-OFFICIAL
else
        PRODUCT_PROPERTY_OVERRIDES += \
            ro.goo.rom=Kayant \
            ro.slim.version=Slim-$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR).$(PRODUCT_VERSION_MAINTENANCE)$(PRODUCT_VERSION_DEVICE_SPECIFIC)-$(shell date +"%Y%m%d-%H%M")-UNOFFICIAL \
            ro.modversion=Slim-$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR).$(PRODUCT_VERSION_MAINTENANCE)$(PRODUCT_VERSION_DEVICE_SPECIFIC)-$(PRODUCT_RELEASE_NAME)-$(shell date +"%Y%m%d-%H%M")-UNOFFICIAL
endif
endif

# FM
PRODUCT_PACKAGES += \
  FMRadioService

# Camera
PRODUCT_PACKAGES += \
  Camera

# Mms
PRODUCT_PACKAGES += \
  Mms

# Apollo
PRODUCT_PACKAGES += \
  Apollo

PRODUCT_COPY_FILES += \
    vendor/slim/prebuilt/hdpi/bootanimation.zip:system/media/bootanimation.zip

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := mb526
PRODUCT_NAME := slim_mb526
PRODUCT_BRAND := MOTO
PRODUCT_MODEL := MB526
PRODUCT_MANUFACTURER := Motorola
PRODUCT_SFX := DFP

#Set build fingerprint / ID / Prduct Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=${PRODUCT_MODEL}_${PRODUCT_SFX} \
    TARGET_DEVICE=umts_jordan \
    BUILD_FINGERPRINT=MOTO/MB526_O2DE/umts_jordan:2.3.6/4.5.1-134_DFP-132/1317968148:user/release-keys \
    PRIVATE_BUILD_DESC="umts_jordan_emara-user 2.3.6 4.5.1-134_DFP-132 1317968148 release-keys" \
    BUILD_NUMBER=${DATE} \
    BUILD_VERSION_TAGS=release-keys \
    TARGET_BUILD_TYPE=user


