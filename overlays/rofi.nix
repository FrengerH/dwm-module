self: super: 

with super; 

let
  theme = builtins.toFile "rofi-theme.rasi" (builtins.readFile ../theme/rofi-theme.rasi);
in
{
  rofi = super.rofi.overrideAttrs(oldAttrs: rec {
    buildInputs = oldAttrs.buildInputs or [] ++ [ pkgs.makeWrapper ];

    postInstall = oldAttrs.postInstall or "" + ''
      wrapProgram $out/bin/rofi \
        --add-flags "-theme ${theme}" \
    '';

  });
}