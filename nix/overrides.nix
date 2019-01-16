{ pkgs }:

self: super:

with { inherit (pkgs.stdenv) lib; };

with pkgs.haskell.lib;

{
  dhall-html = (
    with rec {
      dhall-htmlSource = pkgs.lib.cleanSource ../.;
      dhall-htmlBasic  = self.callCabal2nix "dhall-html" dhall-htmlSource { };
    };
    overrideCabal dhall-htmlBasic (old: {
    })
  );
}
