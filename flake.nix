{
  description = "DWM for Nix";

  outputs = { self, nixpkgs, ... }: {
    dwm-module = import ./dwm-module;
  };
}

