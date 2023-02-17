let
  sha256 = "sha256:13600ls5855xxf8i68a89a1bwmvbql498j5pbvlk8036cbv1kzpy";
  rev = "724bfc0892363087709bd3a5a1666296759154b1";
in
builtins.trace "(Using pinned Nixpkgs at ${rev})"
import (fetchTarball {
  url = "https://github.com/NixOS/nixpkgs/archive/${rev}.tar.gz";
  inherit sha256;
})
