#!/bin/sh

# Maak package.tgz
cd PythonMiniProbe
tar czf ../package.tgz *

# Maak INFO file
cat ../INFO.tpl > ../INFO

# Zet MD5 checksum van package.tgz in INFO file
CHECKSUM=$(md5 -q ../package.tgz)
sed -i -e "s|@checksum@|${CHECKSUM}|g" ../INFO

# Maak icons en zet deze om naar base54 voor in INFO file
SPK_ICON=../icon350x350.png
PACKAGE_ICON=$(convert ${SPK_ICON} -thumbnail 72x72 - | base64)
PACKAGE_ICON_120=$(convert ${SPK_ICON} -thumbnail 120x120 - | base64 -)
PACKAGE_ICON_256=$(convert ${SPK_ICON} -thumbnail 256x256 - | base64 -)

sed -i -e "s|@package_icon@|${PACKAGE_ICON}|g" ../INFO
sed -i -e "s|@package_icon_120@|${PACKAGE_ICON_120}|g" ../INFO
sed -i -e "s|@package_icon_256@|${PACKAGE_ICON_256}|g" ../INFO

rm ../INFO-e

# Maak .spk
TIMESTAMP=$(date +%s)
cd ..
tar -cvf dist/SynologyPythonMiniProbe-${TIMESTAMP}.spk scripts INFO package.tgz WIZARD_UIFILES

# Cleanup
rm package.tgz