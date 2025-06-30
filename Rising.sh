#acckunta
git config --global user.name "NotWorthy01"
git config --global user.email "fkjfjf@gmail.com"

#linux-x86 remove 
rm -rf prebuilts/clang/host/linux-x86
# repo init rom
repo init -u https://github.com/GenesisOS/manifest.git -b verve-qpr2 --git-lfs
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
subject='/C=US/ST=State/L=City/O=Android/OU=Android/CN=Android/emailAddress=email@example.com'
for x in releasekey platform shared media networkstack verity otakey testkey sdk_sandbox bluetooth nfc; do \
    ./development/tools/make_key vendor/genesis/signing/keys/$x "$subject"; \
done
echo "============="
echo "sign success"
echo "============="

# Lunch
breakfast haydn
echo "============="
echo "lunch done"
echo "============="
# Build
mka genesis
echo "============="
echo "Rom built"
echo "============="
