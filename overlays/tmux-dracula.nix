self: super:

with super;

let

in
{
  tmuxPlugins.dracula = super.tmuxPlugins.dracula.overrideAttrs (old: {
    src = super.fetchFromGitHub {
      owner = "FrengerH";
      repo = "tmux-dracula";
      rev = "a23870719534a33f14021cb46bfa160f1b6ab542";
      sha256 = "sha256-MYV0A4VfzLL/HewaY8Oefqeer4V8iAyk81CfJZCjxTY=";
    };
  });
}
