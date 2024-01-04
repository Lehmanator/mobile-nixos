{ mobile-nixos
, fetchFromGitLab
, fetchpatch
, ...
}:

mobile-nixos.kernel-builder {
  version = "6.7.0";
  configfile = ./config.aarch64;

  src = fetchFromGitLab {
    owner = "sdm845-mainline";
    repo = "linux";
    rev = "ecab2cb65fea7355782539d44df7adc2c453d178";
    hash = "sha256-qNzIkLSUumSZGrdjkNK+R/0+yROrZkM+uNVwrRiNt9I=";
  };

  patches = [
    # ASoC: codecs: tas2559: Fix build
    (fetchpatch {
      url = "https://github.com/samueldr/linux/commit/d1b59edd94153ac153043fb038ccc4e6c1384009.patch";
      sha256 = "sha256-zu1m+WNHPoXv3VnbW16R9SwKQzMYnwYEUdp35kUSKoE=";
    })
  ];

  isModular = false;
  isCompressed = "gz";
}
