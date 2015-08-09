#!/bin/bash

# Grab patches for Ubuntu

# BUILD
cd build

# Allow a device to generically define its own headers
git fetch https://github.com/cm-3470/android_build phablet
git cherry-pick 393177ad9e5e03437b2fd0981a14b1841ce3d406
cd -

# FRAMEWORK
cd frameworks/av

# camera: allow device to append camera parameters
git fetch https://github.com/cm-3470/android_frameworks_av.git phablet
git cherry-pick 0761ee7bd3ccca8b0407993c9e97a85f3de598b5

# camera: Fix inclusion of CameraParametersExtra.h
git cherry-pick f4a3f3432f6506b41d6ab61a12884cf1b7786f46

# Add Samsung WFD Service -- required for HWComposer
git cherry-pick f24e326355824a60cd4b926e8d48ba15cc17ab06
cd -
