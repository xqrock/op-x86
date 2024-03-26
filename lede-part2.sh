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
sed -i 's/192.168.1.1/192.168.188.251/g' package/base-files/files/bin/config_generate
# rm -rf ./feeds/luci/themes/luci-theme-argon
# rm -rf ./feeds/luci/applications/luci-app-wrtbwmon
# rm -rf ./feeds/packages/net/adguardhome
# rm -rf ./feeds/packages/net/smartdns
rm -rf ./feeds/luci/applications/luci-app-mosdns
rm -rf ./feeds/packages/net/mosdns
rm -rf feeds/packages/lang/golang
git clone https://github.com/sbwml/packages_lang_golang -b 22.x feeds/packages/lang/golang
