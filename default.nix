{ nixpkgs ? <nixpkgs>
, system ? builtins.currentSystem
, pkgs ? import nixpkgs { inherit system; }
, stdenv ? pkgs.gcc9Stdenv
}:

with pkgs;

#let validator = pkgs.lib.callPackageWith pkgs ./demo.nix {};
#in stdenv.mkDerivation {
stdenv.mkDerivation {
    name = "aws-demo";
    buildInputs = [
          cmake
          #validator
          curl
          gdb
          ccls
          clang-tools
        ];
    shellHook=
      ''
        alias grep='grep --color $@'
      '';
}
