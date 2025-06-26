#!/bin/bash

#fail jobs
#repo sync -j1 --fail-fast


# repo init rom
repo init -u https://github.com/DerpFest-LOS/android_manifest.git -b 15.2 --git-lfs
echo "=================="
echo "Repo init success"
echo "=================="

# Build Sync
/opt/crave/resync.sh 
echo "============="
echo "Sync success"
echo "============="

# Sync Trees
git clone --depth=1 https://github.com/Killer0701/device-xiaomi-haydn -b derpfest device/xiaomi/haydn


# Set up build environment
. build/envsetup.sh
echo "============="

# vendorset.sh delete
rm -rf device/xiaomi/haydn/vendorsetup.sh
echo "============="
echo "seggs"
echo "============="

#sign 
mkdir -p vendor/lineage-priv/keys

openssl genrsa -out releasekey.pk8 2048
openssl req -new -x509 -key releasekey.pk8 -out releasekey.x509.pem -days 10000 -subj "/CN=ROM Release/O=MyROM/C=US"

openssl genrsa -out platform.pk8 2048
openssl req -new -x509 -key platform.pk8 -out platform.x509.pem -days 10000 -subj "/CN=Platform/O=MyROM/C=US"

openssl genrsa -out shared.pk8 2048
openssl req -new -x509 -key shared.pk8 -out shared.x509.pem -days 10000 -subj "/CN=Shared/O=MyROM/C=US"

openssl genrsa -out media.pk8 2048
openssl req -new -x509 -key media.pk8 -out media.x509.pem -days 10000 -subj "/CN=Media/O=MyROM/C=US"

cd /tmp/src/android

echo "============="
echo "sign successful"
echo "============="
# Lunch
lunch lineage_haydn-bp1a-user
echo "============="
echo "seggs done"
echo "============="
# Build
mka derp
echo "============="
echo "Rom built"
echo "============="
