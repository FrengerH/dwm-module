{ config, pkgs, ... }:

{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi.override { plugins = [ pkgs.rofi-emoji ]; };
    terminal = "${pkgs.st}/bin/st";
    font = "FiraCode Nerd Font Medium 25";
  };
}

