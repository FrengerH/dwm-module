self: super:

with super;

let

in
{
  tmuxPlugins.dracula = super.tmuxPlugins.dracula.overrideAttrs (old: {
    src = super.fetchFromGitHub {
      owner = "FrengerH";
      repo = "tmux-dracula";
      rev = "5bac3cb63bf5e4fb1dbcd729b9ccd7e891bc82ba";
      sha256 = "";
    };
  });
}
