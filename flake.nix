{
  description = "DWM for Nix";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs, ... }:
    {
      dwm = import ./dwm;
    } // utils.lib.eachDefaultSystem (system:
}

