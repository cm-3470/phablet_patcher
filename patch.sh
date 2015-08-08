#!/bin/bash

# Grab patches for Ubuntu

# BIONIC
cd bionic

# bionic: Add flag to restore legacy mmap behavior
git fetch https://github.com/CyanogenMod/android_bionic cm-12.1
git cherry-pick aa729cb8dd274ea5a6bfc6055a035780478b2d68
cd -

# BUILD
cd build

# Allow a device to generically define its own headers
git fetch https://github.com/CyanogenMod/android_build.git cm-12.1
git cherry-pick fbd04b338a856b8c484946d748202d6aa6b27158
cd -

# FRAMEWORK
cd frameworks/av

# Add Samsung WFD Service -- required for HWComposer
git fetch https://github.com/cm-3470/android_frameworks_av.git phablet
git cherry-pick eebc8e8db34b41e1dff2a9a5195642b3650aeb93

git fetch https://github.com/CyanogenMod/android_frameworks_av.git cm-12.0
# stagefright: Add legacy MediaBuffer::acquireBuffer symbol
git cherry-pick 7af55c5b5cf6a1369bc72869913703536c4faae9

# camera: allow device to append camera parameters
# camera: Fix inclusion of CameraParametersExtra.h
git cherry-pick 8b850c19f85c0c0512acee4b2899f7daf4c7aca5
git cherry-pick 9246d55636b5072277c1ea04376426f6ae956edd
cd -

cd frameworks/native

# Revert "Remove Parcel::writeIntPtr."
git fetch https://github.com/cm-3470/android_frameworks_native.git cm-12.1
git cherry-pick 4a7379958e9da92b69e359e541f809efd64ba006
cd -
