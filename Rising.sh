#!/bin/bash

#fail jobs
#repo sync -j1 --fail-fast
git config --global user.name "NotWorthy01"
git config --global user.email "fkjfjf@gmail.com"

#linux-x86 remove 
rm -rf prebuilts/clang/host/linux-x86
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
curl -sSf https://raw.githubusercontent.com/Trijal08/crDroid-build-signed-script-auto/main/create-signed-env.sh | bash
echo "============="
echo "sign success"
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
