#!/bin/bash

# repo init rom
repo init --no-repo-verify --git-lfs -u https://github.com/ProjectInfinity-X/manifest -b 15 -g default,-mips,-darwin,-notdefault
echo "=================="
echo "Repo init success"
echo "=================="

# Build Sync
/opt/crave/resync.sh 
echo "============="
echo "Sync success"
echo "============="

# Sync Trees
git clone https://github.com/Killer0701/device_xiaomi_haydn -b Inf-15 device/xiaomi/haydn

# Set up build environment
. build/envsetup.sh
echo "============="

#sign rom
echo "============="
croot && git clone https://github.com/ProjectInfinity-X/vendor_infinity-priv_keys-template vendor/infinity-priv/keys
cd vendor/infinity-priv/keys
./keys.sh
cd ../../..
echo "============="
# Lunch
echo "============="
lunch infinity_haydn-userdebug
echo "============="
# Build
echo "============="
mka bacon
echo "============="
