#!/bin/bash
#=============================================================
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=============================================================
sed -i 's/KERNEL_PATCHVER:=6.1/KERNEL_PATCHVER:=5.15/g' ./target/linux/x86/Makefile
# sed -i 's/KERNEL_PATCHVER:=6.2/KERNEL_PATCHVER:=5.15/g' ./target/linux/x86/Makefile
sed -i 's/KERNEL_PATCHVER:=6.6/KERNEL_PATCHVER:=5.15/g' ./target/linux/x86/Makefile

function merge_package(){
    repo=`echo $1 | rev | cut -d'/' -f 1 | rev`
    pkg=`echo $2 | rev | cut -d'/' -f 1 | rev`
    # find package/ -follow -name $pkg -not -path "package/custom/*" | xargs -rt rm -rf
    git clone --depth=1 --single-branch $1
    mv $2 package/custom/
    rm -rf $repo
}
function drop_package(){
    find package/ -follow -name $1 -not -path "package/custom/*" | xargs -rt rm -rf
}

# Add a feed source
git clone https://github.com/sirpdboy/luci-app-advanced.git package/luci-app-advanced
# git clone https://github.com/thinktip/luci-theme-neobird.git package/luci-theme-neobird
git clone https://github.com/xiaorouji/openwrt-passwall-packages.git package/openwrt-passwall
git clone https://github.com/xiaorouji/openwrt-passwall.git package/passwall
git clone https://github.com/xiaorouji/openwrt-passwall2.git package/passwall2
git clone https://github.com/tty228/luci-app-wechatpush.git package/luci-app-wechatpush
find ./ | grep Makefile | grep v2ray-geodata | xargs rm -f
find ./ | grep Makefile | grep mosdns | xargs rm -f
git clone https://github.com/sbwml/luci-app-mosdns -b v5 package/mosdns
git clone https://github.com/linkease/istore.git package/istore
git clone https://github.com/linkease/istore-ui.git package/istore-ui
# git clone https://github.com/KFERMercer/luci-app-tcpdump.git package/luci-app-tcpdump
merge_package https://github.com/vernesong/OpenClash OpenClash/luci-app-openclash
merge_package https://github.com/kiddin9/kwrt-packages kwrt-packages/luci-app-adguardhome
merge_package https://github.com/kiddin9/kwrt-packages kwrt-packages/luci-app-timewol
merge_package https://github.com/kiddin9/kwrt-packages kwrt-packages/luci-app-timecontrol
merge_package https://github.com/kiddin9/kwrt-packages kwrt-packages/luci-app-weburl
merge_package https://github.com/kiddin9/kwrt-packages kwrt-packages/luci-app-webrestriction
# merge_package https://github.com/kiddin9/kwrt-packages kwrt-packages/wrtbwmon
# merge_package https://github.com/kiddin9/kwrt-packages kwrt-packages/luci-app-wrtbwmon
