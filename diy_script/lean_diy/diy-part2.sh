#!/bin/bash
#
# Copyright (c) 2019-2023 SmallProgram <https://github.com/smallprogram>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/smallprogram/OpenWrtAction
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

rm -rf ./package/custom_packages
mkdir -p ./package/custom_packages

# Modify default IP
sed -i 's/192.168.1.1/10.10.0.253/g' package/base-files/files/bin/config_generate

# Modify default passwd
sed -i '/$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF./ d' package/lean/default-settings/files/zzz-default-settings

# Add Theme
rm -rf ./feeds/luci/themes/luci-theme-argon
rm -rf ./feeds/luci/themes/luci-theme-argon-mod
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git ./package/custom_packages/luci-theme-argon

rm -rf ./feeds/luci/applications/luci-app-argon-config
git clone -b 18.06 https://github.com/jerrykuku/luci-app-argon-config.git ./package/custom_packages/luci-app-argon-config

# adguardhome
# rm -rf ./package/lean/luci-app-adguardhome
git clone https://github.com/rufengsuixing/luci-app-adguardhome.git ./package/custom_packages/luci-app-adguardhome

# mosdns

# find ./ | grep Makefile | grep v2ray-geodata | xargs rm -f
# find ./ | grep Makefile | grep mosdns | xargs rm -f
rm -rf ./feeds/luci/applications/luci-app-mosdns/
rm -rf ./feeds/packages/net/mosdns/
# rm -rf feeds/packages/net/v2ray-geodata/
git clone https://github.com/sbwml/luci-app-mosdns -b v5 ./package/custom_packages/mosdns
# git clone https://github.com/sbwml/v2ray-geodata ./package/custom_packages/v2ray-geodata

# git clone https://github.com/jerrykuku/lua-maxminddb.git
# git clone https://github.com/jerrykuku/luci-app-vssr.git

# docker
rm -rf ./feeds/luci/applications/luci-app-dockerman
rm -rf ./feeds/luci/applications/luci-app-docker
git clone https://github.com/lisaac/luci-app-dockerman.git ./package/custom_packages/luci-app-dockerman

# smartdns
# 由lean package维护版本
# git clone https://github.com/pymumu/smartdns.git ./package/custom_packages/smartdns

# Reset drive type
# sed -i 's/(dmesg | grep .*/{a}${b}${c}${d}${e}${f}/g' package/lean/autocore/files/x86/autocore
# sed -i '/h=${g}.*/d' package/lean/autocore/files/x86/autocore
# sed -i 's/echo $h/echo $g/g' package/lean/autocore/files/x86/autocore

# Close running yards
# sed -i 's/console=tty0//g'  target/linux/x86/image/Makefile

# Diy
# rm -rf ./feeds/luci/modules/luci-mod-admin-full/luasrc/view/admin_status/index.htm
# wget -P ./feeds/luci/modules/luci-mod-admin-full/luasrc/view/admin_status https://github.com/smallprogram/OpenWrtAction/raw/main/source/openwrtfile/index.htm
