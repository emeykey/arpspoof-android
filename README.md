# dSploit ArpSpoof forked module for Android 6-11

This file was part of [dSploit](https://github.com/evilsocket/dsploit) and it's licensed under the GPL v3.

------------

This is forked version of dSploit arpspoof module that is modified to run on newer versions of Android. Compiled with android SDK v23 (compatible therefore with Android 6 to 11).

Tested on Samsung A515F - Android 11, May 2021 build.

This version fixes the SELinux problem with not allowing ioctl to get your HWADDR (MAC address) through libnet.

------------

In libs/ you can find already compiled arpspoof binary for all architectures. (most androids nowadays use arm64-v8a)

If you want to compile it yourself do it so with Android NDK version r12b (https://developer.android.com/ndk/downloads/older_releases#ndk-12b-downloads) you just have to run ndk-build onto jni/ directory of this repository. You will of course encounter this error:

android-ndk-r12b/platforms/android-23/arch-mips/usr/include/linux/if_packet.h:202:2: error: unknown type name '__aligned_u64'
  __aligned_u64 seq_num;


It's fixable by adding this line: 
#define __aligned_u64 __u64 __attribute__((aligned(8)))
on top of the if_packet.h file of the specific architecture.

------------

You will need rooted phone to run this binary.

You will also need Termux and termux-tools, net-tools, nmap, grep and sed packages. (installable with pkg install <package-name>)

Then you will be able to run it. Example:

arpspoof -i wlan0 192.168.0.1

(without ipv4 forwarding enabled this command does DOS on whole LAN subnet)

Always before using on new network run as non-root user "nmap -p22 192.168.0.1/24" (or whatever IP your LAN gateway has) it adds all devices on LAN to your arp cache, so when you run arpspoof on subnet as in example, you attack everything on network and don't leave anything out.