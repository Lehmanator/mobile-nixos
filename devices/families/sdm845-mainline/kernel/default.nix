{ mobile-nixos
, fetchFromGitHub
, fetchFromGitLab
, ...
}:

mobile-nixos.kernel-builder rec {
  version = "6.2.0_dev";
  configfile = ./config.aarch64;

  src = fetchFromGitLab {
    owner = "sdm845-mainline";
    repo = "linux";
    rev = "e09d46cba4562a4bc6e091553a8027a805e5c739"; # sdm845/sdm845-6.1.0
    hash = "sha256-gtk2D/zNfAjvupQzMFo7d6CDBCAbovVbu6NBmp8B4lU=";
  };

  isModular = false;
  isCompressed = "gz";
}
