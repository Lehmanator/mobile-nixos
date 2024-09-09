{ mobile-nixos
, fetchFromGitLab
, fetchpatch
, ...
}:

mobile-nixos.kernel-builder {
  version = "6.9.0";
  configfile = ./config.aarch64;

  src = fetchFromGitLab {
    owner = "sdm845-mainline";
    repo = "linux";
    rev = "sdm845-6.9.0-r2";
    hash = "sha256-PEs/R4L4m+E2qWWiqT/USWABlqParNHDsSneRcmpFVg=";
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
