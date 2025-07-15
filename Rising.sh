#acckunta
git config --global user.name "NotWorthy01"
git config --global user.email "fkjfjf@gmail.com"

#linux-x86 remove 
rm -rf prebuilts/clang/host/linux-x86

# repo init rom
repo init -u https://github.com/VoltageOS-staging/manifest.git -b 16 --git-lfs
echo "=================="
echo "Repo init success"
echo "=================="

# Build Sync
/opt/crave/resync.sh
echo "============="
echo "Sync success"
echo "============="

# Sync Trees
git clone --depth=1 https://github.com/Killer0701/device_xiaomi_haydn -b 16 device/xiaomi/haydn

# Set up build environment
. build/envsetup.sh
echo "============="

# vendorset.sh delete
rm -rf device/xiaomi/haydn/vendorsetup.sh
echo "============="
echo "Vendorsetup.sh delete"
echo "============="

#sign 
curl -sSf https://raw.githubusercontent.com/Trijal08/crDroid-build-signed-script-auto/main/create-signed-env.sh | bash
echo "============="
echo "sign success"
echo "============="

#commit 
cd device/xiaomi/sm8350-common && git fetch https://github.com/Haydn-Lab/device_xiaomi_sm8350-common Inf && git cherry-pick c664daf6ffb1a83fe5860dba21b6ed58b80c5aab
cd ../../..
# Lunch
brunch haydn
echo "============="
echo "lunch done"
echo "============="

# Build
mka bacon
echo "============="
echo "Rom built"
echo "============="
