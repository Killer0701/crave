#acckunta
git config --global user.name "NotWorthy01"
git config --global user.email "fkjfjf@gmail.com"

#linux-x86 remove 
rm -rf prebuilts/clang/host/linux-x86

# repo init rom sync
repo init -u https://github.com/LineageOS/android.git -b lineage-23.0 --git-lfs
echo "=================="
echo "Repo init success"
echo "=================="

# Build Sync
/opt/crave/resync.sh
echo "============="
echo "Sync success"
echo "============="

# Sync Trees
git clone --depth=1 https://github.com/Killer0701/device_xiaomi_haydn -b vostest device/xiaomi/haydn

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


# Lunch
lunch lineage_haydn-userdebug
echo "============="
echo "lunch done"
echo "============="

# Build
mka bacon
echo "============="
echo "Rom built"
echo "============="
