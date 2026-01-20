#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

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

rm -rf package/custom; mkdir package/custom

# Add a feed source
# sed -i '$a src-git mihomo https://github.com/morytyann/OpenWrt-mihomo.git;main' feeds.conf.default
git clone https://github.com/sirpdboy/luci-app-advanced.git package/luci-app-advanced
git clone https://github.com/Openwrt-Passwall/openwrt-passwall-packages package/passwall-packages
git clone https://github.com/Openwrt-Passwall/openwrt-passwall package/passwall-luci
# git clone  https://github.com/gdy666/luci-app-lucky.git package/lucky
git clone https://github.com/tty228/luci-app-wechatpush.git package/luci-app-wechatpush
git clone https://github.com/nikkinikki-org/OpenWrt-nikki.git package/OpenWrt-nikki
find ./ | grep Makefile | grep v2ray-geodata | xargs rm -f
find ./ | grep Makefile | grep mosdns | xargs rm -f
git clone https://github.com/sbwml/luci-app-mosdns -b v5 package/mosdns
git clone https://github.com/sbwml/v2ray-geodata package/v2ray-geodata
git clone https://github.com/linkease/istore.git package/istore
# git clone https://github.com/linkease/istore-ui.git package/istore-ui
git clone https://github.com/sirpdboy/luci-app-ddns-go package/ddns-go
git clone https://github.com/sirpdboy/luci-app-eqosplus package/luci-app-eqosplus
merge_package https://github.com/kiddin9/kwrt-packages kwrt-packages/msd_lite
merge_package https://github.com/vernesong/OpenClash OpenClash/luci-app-openclash
