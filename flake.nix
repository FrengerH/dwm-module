{
  description = "DWM for Nix";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }: {
    dwm-module = import ./dwm-module;
  };
}

