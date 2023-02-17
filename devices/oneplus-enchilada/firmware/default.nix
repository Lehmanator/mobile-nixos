{ lib
, fetchFromGitLab
, runCommand
}:

let
  baseFw = fetchFromGitLab {
    owner = "sdm845-mainline";
    repo = "firmware-oneplus-sdm845";
    rev = "895bb1c8dd0695635df354bbd713740af48e47ce";
    sha256 = "sha256-tgCVkef6HPxKVPtq59d6MAtNta3vcX2n9EwYLIijreE=";
  };
in runCommand "oneplus-sdm845-firmware" {
  inherit baseFw;
  # We make no claims that it can be redistributed.
  meta.license = lib.licenses.unfree;
} ''
  mkdir -p $out/lib/firmware
  cp -r $baseFw/lib/firmware/* $out/lib/firmware/
  chmod +w -R $out
  rm -rf $out/lib/firmware/postmarketos
  cp -r $baseFw/lib/firmware/postmarketos/* $out/lib/firmware
''
