# Copyright (C) 2021 The Proton AOSP Project
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

LOCAL_PATH := vendor/aosp/fonts

# We have to use PRODUCT_PACKAGES (together with BUILD_PREBUILT) instead of
# PRODUCT_COPY_FILES to install the font files, so that the NOTICE file can
# get installed too.

PRODUCT_PACKAGES += \
    CutiveMono.ttf \
    DroidSansMono.ttf \
    HarmonyOSSans-BlackItalic.ttf \
    HarmonyOSSans-Black.ttf \
    HarmonyOSSans-BoldItalic.ttf \
    HarmonyOSSans-Bold.ttf \
    HarmonyOSSans-Italic.ttf \
    HarmonyOSSans-LightItalic.ttf \
    HarmonyOSSans-Light.ttf \
    HarmonyOSSans-MediumItalic.ttf \
    HarmonyOSSans-Medium.ttf \
    HarmonyOSSans-Regular.ttf \
    HarmonyOSSans-ThinItalic.ttf \
    HarmonyOSSans-Thin.ttf \
    Roboto-Regular.ttf \
    Linotte.ttf \
    Manrope-VF.ttf \
    NotoSans-Italic-VF.ttf \
    NotoSans-VF.ttf \
    OnePlusSans-Bold.ttf \
    OnePlusSans-Thin.ttf \
    OnePlusSans-Black.ttf \
    OnePlusSans-Light.ttf \
    OnePlusSans-Italic.ttf \
    OnePlusSans-Medium.ttf \
    OnePlusSans-Regular.ttf \
    OnePlusSans-BoldItalic.ttf \
    OnePlusSans-ThinItalic.ttf \
    OnePlusSans-BlackItalic.ttf \
    OnePlusSans-LightItalic.ttf \
    OnePlusSans-MediumItalic.ttf \
    Recursive-VF.ttf \
    RobotoFallback-VF.ttf \
    RobotoSystem-VF.ttf \
    RobotoStatic-Regular.ttf \
    SamsungOne.ttf \
    SourceSans3-Italic-VF.otf \
    SourceSans3-VF.otf \
    NotoSerif-BoldItalic.ttf \
    NotoSerif-Bold.ttf \
    NotoSerif-Italic.ttf \
    NotoSerif-Regular.ttf \

# Register new fonts
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/fonts_customization.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/fonts_customization.xml \

# Include extra addon fonts
-include vendor/aosp/fonts/extra/extra.mk
