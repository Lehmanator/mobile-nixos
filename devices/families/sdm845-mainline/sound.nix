{ config, lib, pkgs, ... }:

{
  nixpkgs.overlays = [
    (self: super: {
      sdm845-alsa-ucm = self.callPackage
        (
          { runCommand, fetchFromGitLab }:

          runCommand "sdm845-alsa-ucm"
            {
              src = fetchFromGitLab {
                name = "sdm845-alsa-ucm";
                owner = "sdm845-mainline";
                repo = "alsa-ucm-conf";
                rev = "08cbf26e684f5609b3839870887c81be378712f6"; # master
                sha256 = "sha256-ZvknDKjcLyYwlFuqLTOE91GAQM7RykL8flGgYunttS8=";
              };
            } ''
            mkdir -p $out/share/
            ln -s $src $out/share/alsa
          ''
        )
        { };
    })
  ];

  # Alsa UCM profiles
  mobile.quirks.audio.alsa-ucm-meld = true;
  environment.systemPackages = [
    pkgs.sdm845-alsa-ucm
  ];
}
