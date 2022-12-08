self: super: 

with super; 

let
  theme = builtins.toFile "rofi-theme" (builtins.readFile ../theme/rofi-theme.rasi);
in
{
  rofi = super.rofi.overrideAttrs(oldAttrs: rec {
    buildInputs = oldAttrs.buildInputs or [] ++ [ pkgs.makeWrapper ];

    postInstall = oldAttrs.postInstall or "" + ''
      wrapProgram $out/bin/rofi \
        --append-flags "-theme ${theme}" \
    '';

  });
}
