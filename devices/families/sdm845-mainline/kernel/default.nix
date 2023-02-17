{ mobile-nixos
, fetchFromGitHub
, fetchFromGitLab
, ...
}:

mobile-nixos.kernel-builder rec {
  version = "6.1.3";
  configfile = ./config.aarch64;

  src = fetchFromGitLab {
    owner = "sdm845-mainline";
    repo = "linux";
    rev = "a5312556efefb2d93385681687a54fc5f6862c32"; # sdm845/6.1-release
    hash = "sha256-zcOLbRE//+f9iwIUGFPUqYHH6hL4f3Gen+Ottrpr5DE=";
  };

  isModular = false;
  isCompressed = "gz";
}
