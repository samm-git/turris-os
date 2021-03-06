# Use the default kernel version if the Makefile doesn't override it

LINUX_RELEASE?=1

LINUX_VERSION-3.10 = .49

ifeq ($(LINUX_VERSION),3.3.8)
  LINUX_KERNEL_MD5SUM:=f1058f64eed085deb44f10cee8541d50
endif
ifeq ($(LINUX_VERSION),3.6.11)
  LINUX_KERNEL_MD5SUM:=3d602ad7f7984509c3e923a5ae90bc54
endif
ifeq ($(LINUX_VERSION),3.8.13)
  LINUX_KERNEL_MD5SUM:=2af19d06cd47ec459519159cdd10542d
endif
ifeq ($(LINUX_VERSION),3.9.11)
  LINUX_KERNEL_MD5SUM:=edbf88eb7f7d34dbd5d3887726790755
endif
ifeq ($(LINUX_VERSION),3.10.49)
  LINUX_KERNEL_MD5SUM:=9774e12764e740d49c80eda77d0ef3eb
endif
ifeq ($(LINUX_VERSION),3.13.7)
  LINUX_KERNEL_MD5SUM:=370adced5e5c1cb1d0d621c2dae2723f
endif
ifeq ($(LINUX_VERSION),3.14.12)
  LINUX_KERNEL_MD5SUM:=7e76da2910683fe4dfbcec6ebfdd9a32
endif

ifdef KERNEL_PATCHVER
  LINUX_VERSION:=$(KERNEL_PATCHVER)$(strip $(LINUX_VERSION-$(KERNEL_PATCHVER)))
endif

split_version=$(subst ., ,$(1))
merge_version=$(subst $(space),.,$(1))
KERNEL_BASE=$(firstword $(subst -, ,$(LINUX_VERSION)))
KERNEL=$(call merge_version,$(wordlist 1,2,$(call split_version,$(KERNEL_BASE))))
KERNEL_PATCHVER ?= $(KERNEL)

# disable the md5sum check for unknown kernel versions
LINUX_KERNEL_MD5SUM:=$(LINUX_KERNEL_MD5SUM-$(strip $(LINUX_VERSION)))
LINUX_KERNEL_MD5SUM?=x
