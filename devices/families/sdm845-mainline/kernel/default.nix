{
  mobile-nixos,
  fetchFromGitLab,
  fetchpatch,
  lib,
  ...
}:
mobile-nixos.kernel-builder {
  version = "6.7.4";
  configfile = ./config.aarch64;

  src = fetchFromGitLab {
    owner = "sdm845-mainline";
    repo = "linux";
    rev = "450ba36a9e9f9fb6a1b9773f5fb08cc4fb2ee941";
    hash = "sha256-LRxlqgZG4HjvsKgaEg9zYv58CbexAssW1qIRb3hOr14=";
  };

  isModular = false;
  isCompressed = "gz";
}
