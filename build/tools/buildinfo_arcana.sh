echo "# start Arcana-Ext build properties"

echo "ro.arcana.device=$AOSP_DEVICE"
echo "ro.arcana.version=$ARCANA_VERSION"
echo "ro.arcana.releasetype=$ARCANA_BUILD_TYPE"
echo "ro.modversion=Arcana-Ext-$ARCANA_VERSION-$ARCANA_CODE-`$DATE +%Y%m%d-%H%M`-$ARCANA_BUILD_TYPE"
echo "ro.arcana.display.version=Arcana-Ext-$ARCANA_VERSION-$ARCANA_BUILD_TYPE"
echo "ro.arcana.fingerprint=Arcana-Ext/$ARCANA_VERSION/$ARCANA_CODE/$PLATFORM_VERSION/$AOSP_DEVICE/$PACKAGE_BUILD_TYPE/`$DATE +%Y%m%d-%H%M`"
echo "ro.arcana.build_date_utc=`$DATE +%s`"

echo "# end Arcana-Ext build properties"
