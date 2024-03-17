#!/bin/bash
#============================================================
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#============================================================

# rm -rf ./feeds/luci/applications/luci-app-wrtbwmon
rm -rf ./feeds/luci/applications/luci-app-mosdns
rm -rf ./feeds/packages/net/mosdns
# rm -rf ./feeds/luci/applications/luci-app-wechatpush
rm -rf feeds/packages/lang/golang
git clone https://github.com/sbwml/packages_lang_golang -b 22.x feeds/packages/lang/golang
