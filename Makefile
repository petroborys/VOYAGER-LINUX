include $(TOPDIR)/rules.mk

# Name, version and release number
# The name and version of your package are used to define the variable to point to the build directory of your package: $(PKG_BUILD_DIR)
PKG_NAME:=VOYAGER-LINUX
PKG_VERSION:=1.0.37

# Source settings (i.e. where to find the source codes)
# This is a custom variable, used below
SOURCE_DIR:=./source

include $(INCLUDE_DIR)/package.mk

# Package definition; instructs on how and where our package will appear in the overall configuration menu ('make menuconfig')
define Package/$(PKG_NAME)
  SECTION:=utils
  CATEGORY:=ToolSensePackages
  TITLE:=VOYAGER-LINUX
  DEPENDS:= +libmosquitto-ssl +libstdcpp +libpthread +libcurl
endef

# Package description; a more verbose description on what our package does
define Package/$(PKG_NAME)/description
  A simple application to use Modbus.
endef

# Package preparation instructions; create the build directory and copy the source code. 
# The last command is necessary to ensure our preparation instructions remain compatible with the patching system.
define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	cp -r $(SOURCE_DIR)/* $(PKG_BUILD_DIR)
	$(Build/Patch)

endef

# Package install instructions; create a directory inside the package to hold our executable, and then copy the executable we built previously into the folder
define Package/$(PKG_NAME)/install
	#$(CP) ./files/* $(1)/
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/$(PKG_NAME) $(1)/usr/bin
endef

# Script to be run after the package has been installed
define Package/$(PKG_NAME)/postinst
endef

# Script to be run after the package has been installed
define Package/$(PKG_NAME)/prerm
endef

# This command is always the last, it uses the definitions and variables we give above in order to get the job done
$(eval $(call BuildPackage,$(PKG_NAME)))