self: super:

with super;

let

in
{
  tmuxPlugins.dracula = super.tmuxPlugins.dracula.overrideAttrs (old: {
    src = super.fetchFromGitHub {
      owner = "FrengerH";
      repo = "tmux-dracula";
      rev = "38917579809cd9ecd17c13d5ffd724a1615544fe";
      sha256 = "sha256-MXstcuohQF2EKszCRmuBgeqocprsG2GWmkBna2f89QY=";
    };
  });
}
