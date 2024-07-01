{ mobile-nixos
, fetchFromGitLab
# , fetchgit
# , lib
, ...
}:
#
# config.aarch64: 
# config-postmarketos-qcom-sdm845.aarch64:
# - https://gitlab.com/postmarketOS/pmaports/-/blob/master/device/community/linux-postmarketos-qcom-sdm845/config-postmarketos-qcom-sdm845.aarch64
#
# Branches:
# - sdm845/6.9-{release,dev,test,camera}
# - sdm845/6.9-dev
#
# https://gitlab.com/postmarketOS/pmaports/-/blob/master/device/community/linux-postmarketos-qcom-sdm845/APKBUILD
# APKBUILD = {
#   arch = "aarch64";
#   _flavor = "postmarketos-qcom-sdm845";
#   _config = "config-$_flavor.$arch";
#   _tag = "sdm845-6.9.0-r2";
# };
#
mobile-nixos.kernel-builder rec {
  version = "6.9.0";
  configfile = ./config.aarch64;

  # ./device/community/linux-postmarketos-qcom-sdm845
  # configfile = fetchFromGitLab {
  #   owner = "postmarketOS";
  #   repo = "pmaports";
  #   rev = "647f2bc640fc6a3d7d15c430a10c0f1f46940b6a";
  #   hash = lib.fakeHash;
  # };
  # configfile = fetchgit {
  #   url = "https://gitlab.com/postmarketOS/pmaports";
  #   rev = "647f2bc640fc6a3d7d15c430a10c0f1f46940b6a";
  #   sparseCheckout = ["device/community/linux-postmarketos-qcom-sdm845"];
  #   hash = lib.fakeHash;
  # };
  # configfile = fetchurl {
  #   url = "https://gitlab.com/postmarketOS/pmaports/-/raw/master/device/community/linux-postmarketos-qcom-sdm845/config-postmarketos-qcom-sdm845.aarch64";
  #   hash = lib.fakeHash;
  # };

  src = fetchFromGitLab {
    owner = "sdm845-mainline";
    repo = "linux";
    rev = "sdm845-${version}";
    hash = "sha256-7QRhleNmvE+1XqwwzOpAb31n9NIwVSVnLoTNZw0Yj40="; # Branch: sdm845-6.9.0
    # rev = "9b5a660025d05949db1f771b34e04ebdd1e06199"; # Branch: sdm845-6.9.0
    # hash = "sha256-UaCBjFG0TuyZhISO6H6T0oNiBft6rYJGVHZnQgal+HQ=";
    # hash = lib.fakeHash;
  };

  isModular = false;
  isCompressed = "gz";
}
