#acckunta
git config --global user.name "NotWorthy01"
git config --global user.email "fkjfjf@gmail.com"

#linux-x86 remove 
rm -rf prebuilts/clang/host/linux-x86

# repo init rom
repo init -u https://github.com/Project-Mist-OS/manifest -b vic --git-lfs
echo "=================="
echo "Repo init success"
echo "=================="

# Build Sync
/opt/crave/resync.sh
echo "============="
echo "Sync success"
echo "============="

# Sync Trees
git clone --depth=1 https://github.com/Killer0701/device-xiaomi-haydn -b lineage-22.2 device/xiaomi/haydn


# Set up build environment
. build/envsetup.sh
echo "============="

# vendorset.sh delete
rm -rf device/xiaomi/haydn/vendorsetup.sh
echo "============="
echo "Vendorsetup.sh delete"
echo "============="

#sign 
echo "============="
echo "sign success"
echo "============="

# Lunch
mistify haydn user
echo "============="
echo "lunch done"
echo "============="
# Build
mist sb
echo "============="
echo "Rom built"
echo "============="
