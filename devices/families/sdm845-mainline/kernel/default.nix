{ mobile-nixos
, fetchFromGitHub
, fetchFromGitLab
, ...
}:

mobile-nixos.kernel-builder rec {
  version = "6.2.0-rc3";
  configfile = ./config.aarch64;

  src = fetchFromGitLab {
    owner = "sdm845-mainline";
    repo = "linux";
    rev = "sdm845-6.2.0_rc3"; # sdm845/sdm845-6.1.0
    hash = "sha256-b+TfNaFwXN38OcZ/q69beLv4sjLTHhJpp8eRjxcgOZY=";
  };

  isModular = false;
  isCompressed = "gz";
}
