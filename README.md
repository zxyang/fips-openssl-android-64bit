# fips-openssl-android
Complie FIPS validated OpenSSL libcrytpo modules. including 64bit architecture. It is up to date with OpenSSL-FIPS-2.0.11 and OpenSSL-1.0.2e

This repo contains 
  1. prebuilt FIPS (openssl-2.0.11) armv7 and aarch64 libs under fips directory.
  2. prebuilt armv7 and aarch64 OpenSSL (openssl-1.0.2e) libcrypto and libssl. They are located at openssl directory.
  3. shell scripts that you can build these libraries yourself
  4. openssl-fips-2.0.11.tar.gz and openssl-1.0.2e.tar.gz. these are just for convinience. you should probably download them directly from OpenSSL.

## Build Instructions:

  These scripts are tested with Ubuntu. But may be adapted to other platforms.

  1. Download and install Android NDK r10e or up.
    Download and install Android SDK with platform tools 21 installed
    Set environment variable ANDROID_NDK_ROOT and ANDROID_SDK_ROOT to the installation directory of Android NDK and SDK home.
  2. Download the repo in a directory and following commands in sequence
    * ./buildfips.sh
    * ./buildfips64.sh
    * ./buildopenssl.sh
    * ./buildopenssl64.sh
