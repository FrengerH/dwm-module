{
  description = "DWM for Nix";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs, ... }:
    {
      dwm-module = import ./dwm;
    };
  let

  in {
    dwm-module = import ./dwm;
  }
}

