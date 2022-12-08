{
  description = "DWM for Nix";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }: {
    # system = "x86_64-linux";

    # pkgs = import nixpkgs {
    #   inherit system;
    #   config = { 
    #     allowUnfree = true; 
    #     pulseaudio = true;
    #   };
    # };   

    dwm-module = import ./dwm-module;
  };
}

