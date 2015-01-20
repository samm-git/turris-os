#
# Copyright (C) 2013 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

# kmod-usb-core kmod-usb2 kmod-usb2-fsl \
# kmod-i2c-core \
# kmod-i2c-mpc kmod-usb-storage-extras kmod-usb-storage \
# block-mount kmod-mmc kmod-mmc-fsl-p2020 \

define Profile/TURRISNOR
	NAME:=Turris-nor
	PACKAGES:=\
		mtd-utils mtd-utils-nandwrite mtd-utils-nandtest mtd-utils-nanddump \
		mtd-utils-flash-erase mtd-utils-flash-eraseall rescue-mode dropbear getmac \
		-opkg -dnsmasq -firewall -6relayd -odhcp6c -iptables -ip6tables -ppp \
		-swconfig -ubox -uci -kmod-leds-gpio -kmod-ipt-conntrack -kmod-ipt-core -kmod-ipt-nat \
		-kmod-ipt-nathelper -ubus -ubusd -jshn -netifd -kmod-input-core -kmod-input-gpio-keys \
		-kmod-button-hotplug -base-files 
endef

define Profile/TURRISNOR/Description
	Package set optimized for the Turris NOR.
endef
$(eval $(call Profile,TURRISNOR))
