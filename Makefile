include $(TOPDIR)/rules.mk

PKG_NAME:=redsocks2
PKG_VERSION:=d01c2a34e1
PKG_RELEASE:=1.1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/semigodking/redsocks.git
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=d01c2a34e1d42a2d705f2674d76f00013847250d
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_SOURCE_VERSION).tar.gz
PKG_MAINTAINER:=semigodking  <semigodking@gmail.com>
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)/$(BUILD_VARIANT)/$(PKG_NAME)-$(PKG_VERSION)

include $(INCLUDE_DIR)/package.mk

define Package/redsocks2
  SECTION:=net
  CATEGORY:=Network
  TITLE:=Redirect any TCP connection to a SOCKS or HTTPS proxy server
  URL:=https://github.com/semigodking
  DEPENDS:=+libevent2 +libopenssl
endef

define Package/redsocks2/description
This is a modified version of original redsocks. \
The name is changed to be REDSOCKS2 since this release to distinguish with original redsocks. \
This variant is useful for anti-GFW (Great Fire Wall).
endef

define Package/redsocks2/conffile
/etc/redsocks2.conf.example
endef

define Package/redsock2/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/redsocks2 $(1)/usr/bin
	$(INSTALL_DIR) $(1)/etc/
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/redsocks.conf.example $(1)/etc/redsocks2.conf.example
endef

$(eval $(call BuildPackage,redsocks2))
