LOCAL_PATH := $(call my-dir)
MY_LOCAL_PATH := $(LOCAL_PATH)
include $(CLEAR_VARS)

LOCAL_MODULE := arpspoof

LOCAL_SRC_FILES := hashmap.c \
					arp.c \
					net.c \
                   	arpspoof.c
                   
APP_PLATFORM:=android-23
APP_OPTIM := release

LOCAL_CFLAGS:= -static -ffunction-sections -fdata-sections
LOCAL_LDFLAGS += -Wl,--gc-sections

LOCAL_C_INCLUDES := libpcap libnet/include include
LOCAL_STATIC_LIBRARIES := libpcap libnet

CFLAGS += -fPIE
LDFLAGS += -fPIE -pie

include $(BUILD_EXECUTABLE)
include $(MY_LOCAL_PATH)/libpcap/Android.mk
include $(MY_LOCAL_PATH)/libnet/Android.mk