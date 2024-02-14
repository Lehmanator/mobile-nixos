{
  config,
  lib,
  pkgs,
  ...
}: {
  nixpkgs.overlays = [
    (self: super: {
      sdm845-alsa-ucm = self.callPackage ({
        runCommand,
        fetchFromGitLab,
      }:
        runCommand "sdm845-alsa-ucm" {
          src = fetchFromGitLab {
            name = "sdm845-alsa-ucm";
            owner = "sdm845-mainline";
            repo = "alsa-ucm-conf";
            rev = "c5a680c08b39d4a665479c9bd30481a137b60cc4"; # Branch: sdm845-phones (2024-02-14)
            sha256 = "sha256-s4S4ULVkxGPAm0+0xzbvxWDX695XpiKWOp06/oMyU9s=";
          };
        } ''
          mkdir -p $out/share/
          ln -s $src $out/share/alsa
        '') {};
    })
  ];

  # Alsa UCM profiles
  mobile.quirks.audio.alsa-ucm-meld = true;
  environment.systemPackages = [pkgs.sdm845-alsa-ucm];
}
