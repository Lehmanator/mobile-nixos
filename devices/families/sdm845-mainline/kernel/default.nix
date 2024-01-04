{ mobile-nixos
, fetchFromGitLab
, fetchpatch
, ...
}:

mobile-nixos.kernel-builder {
  version = "6.7.0-rc5";
  configfile = ./config.aarch64;

  src = fetchFromGitLab {
    owner = "sdm845-mainline";
    repo = "linux";
    rev = "ecab2cb65fea7355782539d44df7adc2c453d178";
    hash = "sha256-qNzIkLSUumSZGrdjkNK+R/0+yROrZkM+uNVwrRiNt9I=";
  };

  isModular = false;
  isCompressed = "gz";
}
