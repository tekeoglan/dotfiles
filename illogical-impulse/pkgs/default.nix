{
  pkgs,
}:
let
  inherit (pkgs) lib;
in
lib.fix(self: {
  illogical-impulse-oneui4-icons = pkgs.callPackage ./illogical-impulse-oneui4-icons {};
})