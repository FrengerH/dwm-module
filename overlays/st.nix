self: super: 

with super; 

let
  startupScript = super.writeShellScriptBin "startupScript" (builtins.readFile ../scripts/tmux-start.sh); 
in
{
  st = super.st.overrideAttrs(oldAttrs: rec {
    buildInputs = oldAttrs.buildInputs or [] ++ [ pkgs.makeWrapper ];

    src = super.fetchFromGitHub {
      owner = "FrengerH";
      repo = "st";
      rev = "7fb0c0cc681f36be2ad12091ef93a41671f32738";
      sha256 = "sha256-pULT784097GkY+rXElCCYLExJ5ORxYlJ5qeXCojUx0c=";
    };

    patches = [
      ./patches/st.diff
    ];

    postInstall = oldAttrs.postInstall or "" + ''
      wrapProgram $out/bin/st \
        --append-flags "-e ${startupScript}/bin/startupScript" \
    '';

  });
}
