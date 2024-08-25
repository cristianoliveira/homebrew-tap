{ pkgs ? import <nixpkgs> {} }:
  pkgs.mkShell {
    buildInputs = with pkgs; [
      coreutils
      gawk
      git
      curl
      wget
      gnumake
    ];
  }
