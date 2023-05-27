#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate
# rm -rf ./feeds/luci/applications/luci-app-qbittorrent
rm -rf ./feeds/luci/applications/luci-app-serverchan
rm -rf ./feeds/luci/applications/luci-app-mosdns
# rm -rf ./package/diy-ziyong/adguardhome
rm -rf ./package/diy-ziyong/smartdns
rm -rf ./feeds/packages/net/adguardhome
rm -rf ./feeds/packages/net/smartdns
#rm -rf ./feeds/packages/net/mosdns
# rm -rf ./package/diy-ziyong/adguardhome
rm -rf ./feeds/luci/themes/luci-theme-argon
rm -rf ./feeds/luci/applications/luci-app-wrtbwmon
rm -rf .package/sirpdboy-package/smartdns
rm -rf .package/sirpdboy-package/adguardhome
rm -rf .package/sirpdboy-package/luci-app-dockerman
rm -rf .package/sirpdboy-package/luci-app-autotimeset
# rm -rf ./feeds/packages/net/https-dns-proxy
# svn co https://github.com/Lienol/openwrt-packages/trunk/net/https-dns-proxy feeds/packages/net/https-dns-proxy
# rm -rf feeds/packages/lang/golang
# svn export https://github.com/sbwml/packages_lang_golang/trunk feeds/packages/lang/golang
