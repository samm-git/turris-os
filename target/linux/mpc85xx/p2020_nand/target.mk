FEATURES:= $(FEATURES) rtc jffs2_nand nand 
BOARDNAME:=P2020_NAND

define Target/Description
	Build firmware images for generic MPC85xx P2020 based boards with NAND flash memory.
endef

