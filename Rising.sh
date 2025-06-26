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


echo "============="
echo "sign successful"
echo "============="
# Lunch
lunch lineage_haydn-bp1a-userdebug
echo "============="
echo "seggs done"
echo "============="
# Build
mka derp
echo "============="
echo "Rom built"
echo "============="
