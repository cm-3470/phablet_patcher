#!/bin/bash

# Grab patches for Ubuntu

# BIONIC
cd bionic

# Partial revert "Remove ioprio_get(2) and ioprio_set(2) from LP64."
git fetch https://github.com/CyanogenMod/android_bionic cm-12.1
git cherry-pick 193c39ce03b9897397fe214f948c1fdbd6fa9899

# bionic: Add flag to restore legacy mmap behavior
git cherry-pick aa729cb8dd274ea5a6bfc6055a035780478b2d68
cd -

# FRAMEWORK
cd frameworks/av

# Add Samsung WFD Service -- required for HWComposer
git fetch https://github.com/cm-3470/android_frameworks_av.git cm-12.0
git cherry-pick d4848efbd5650a48f93a784e5de248a13b830c04

# stagefright: Add legacy MediaBuffer::acquireBuffer symbol
git cherry-pick 7af55c5b5cf6a1369bc72869913703536c4faae9
cd -

cd frameworks/native

# Revert "Remove Parcel::writeIntPtr."
git fetch https://github.com/cm-3470/android_frameworks_native.git cm-12.1
git cherry-pick ce3244f93e8c42ba0f67b449647d2c2e2b5c2f76
cd -
