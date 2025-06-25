#!/bin/bash

#fail jobs
#repo sync -j1 --fail-fast


# repo init rom
repo init -u https://github.com/RisingOS-Revived/android -b qpr2 --git-lfs
echo "=================="
echo "Repo init success"
echo "=================="

# Build Sync
/opt/crave/resync.sh 
echo "============="
echo "Sync success"
echo "============="

# Sync Trees
git clone --depth=1 https://github.com/Killer0701/device-xiaomi-haydn.git -b lineage-22.2 device/xiaomi/haydn

# Set up build environment
. build/envsetup.sh
echo "============="

#sign rom
echo "============="

echo "============="
# Lunch
echo "============="
lunch infinity_haydn-userdebug
echo "============="
# Build
echo "============="
mka bacon
echo "============="
