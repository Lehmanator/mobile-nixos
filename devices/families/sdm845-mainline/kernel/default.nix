{ mobile-nixos
, fetchFromGitHub
, fetchFromGitLab
, ...
}:

mobile-nixos.kernel-builder rec {
  version = "6.1.0";
  configfile = ./config.aarch64;

  src = fetchFromGitLab {
    owner = "sdm845-mainline";
    repo = "linux";
    rev = "sdm845-6.1.0"; # sdm845/sdm845-6.1.0
    hash = "sha256-VzwUEBv0EoWO9trR1vbN1a3N2/+vpcrximKq1wopCpw=";
  };

  isModular = false;
  isCompressed = "gz";
}
