{
  description = "DWM for Nix";

  outputs = { self, ... }: {
    dwm-module = import ./dwm-module;
  };
}

