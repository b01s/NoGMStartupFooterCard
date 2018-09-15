include $(THEOS)/makefiles/common.mk

PACKAGE_VERSION = $(THEOS_PACKAGE_BASE_VERSION)

TWEAK_NAME = NoGMStartupFooterCard
NoGMStartupFooterCard_FILES = Tweak.xm

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
