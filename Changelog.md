# Jflte DevCon Team
### Developers & Testers
[B--B](https://github.com/B--B) - Lead

[AntaresOne](http://github.com/AntaresOne) - Developer, git mantainer, scripting, tester

[Alucard24](http://github.com/Alucard24) - Kernel Developer

[MatthewBooth](http://github.com/MatthewBooth) - OTA Updates, git maintainer, scripting, tester

[angelcalibur](https://github.com/angelcalibur) - Tester

[smeroni68](https://github.com/smeroni68) - Tester

[Jimsilver73](https://github.com/Jimsilver73) - Tester

[hawkerpaul](https://github.com/hawkerpaul) - Tester, scripting

[franzyroy](https://github.com/franzyroy) - Tester, cm themer

[smstiv](https://github.com/smstiv) - Tester

[side](https://github.com/dkati) - Tester, cm themer, rom maintainer

[javelinanddart](https://github.com/javelinanddart) - Kernel Developer

[srisurya95](https://github.com/srisurya95) - Rom-Kernel Developer

[gadget!](http://forum.xda-developers.com/member.php?u=2026779) - Themer, tester, graphic designer

### Changelog (full)
[AOSP-JF-MM](https://github.com/AOSP-JF-MM) - Project GitHub

### Changelog (short)

#### Ongoing changes (Alpha 3)...
* Kernel (JFLTE)
    * Compile with GCC 6.0.1 + fixed compiling warns
    * Small code updates
* ROM
    * WIP: initial Xiaomi Gemini bringup
    * Ported + fixed all CAF code on our repos
    * Deskclock: temporary revert CAF additions until bootloop issues are fixed
    * Bluetooth: fix JFLTE bluetooth after CAF code merge
    * WIP: bring back browser from MM
    * Gallery2: switch to SnapdragonGallery + cm fixes/enhancements
    * jflte: Add support for Samsung extended AGPS
    * STweaks: fixed profile check
    * Fix SuperSU installation for block-based OTAs
    * SuperSU: update to v2.78SR1
    * Substratum: update to v231
    * jflte: GPS: removed not used files/services
    * msm8960: audio: fixes for voip and calls
    * msm8960: display: fixes and improved portability
    * jflte: remove some QC encoders from codecs list
    * Update sources to Android 7.0.0 release 14

#### Alpha 2 (20160902)
* Kernel
    * Fixed boot on N
    * Ramdisk: updated and fixed scripts for N
    * Ramdisk: updated and fixed scripts for systemless root
    * Merged latest 3.18 fixes/updates for ext4
    * General code updates/fixes
    * Fixed CVE-2015-8839
* ROM
    * Added exfat and NTFS support
    * System Sounds: use Stereophonic & Remastered Nexus sounds
    * Materialized some old icons/colours/toasts
    * Fixed NFC
    * Speed up animations
    * Audio: enabled custom audio policy again
    * Sepolicy: fixes + partial updates for N
    * frameworks/native: ported CAF code (mostly on surfaceflinger)
    * Add back changelog to Settings
    * SystemUpdateService: enable service but lock its receivers
    * Frameworks/base: general optimisations
    * skia: ported CAF code
    * Camera: various fixes
    * Build: fixed backuptools and override props functions
    * Build: completely reworked ROM versioning
    * OMS: exposed almost all harcoded colours (WIP)
    * native: ported cm fixes for QCOM devices
    * Webview: use Google WebView version instead of stock AOSP
    * Fixed LEDify
    * STweaks: fixed systemless root detection
    * SuperSU: update to v2.78
    * Settings: general fixes/enhancements and some icon materialization
    * Base: partially ported CAF code/optimisations
    * Update sources to Android 7.0.0 release 6
    * RIL: removed old LP hack for NO SIM issue in Airplane Mode and fix things in a proper way

#### Alpha 1 (20160901)

* Initial public release