{ mobile-nixos
, fetchFromGitLab
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

  src = fetchFromGitLab {
    owner = "sdm845-mainline";
    repo = "linux";
    rev = "sdm845-${version}";
    hash = "sha256-7QRhleNmvE+1XqwwzOpAb31n9NIwVSVnLoTNZw0Yj40="; # Branch: sdm845-6.9.0
  };

  isModular = false;
  isCompressed = "gz";
}
