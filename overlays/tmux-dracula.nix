self: super:

with super;

let

in
{
  tmuxPlugins.dracula = super.tmuxPlugins.dracula.overrideAttrs (old: {
    src = super.fetchFromGitHub {
      owner = "FrengerH";
      repo = "tmux-dracula";
      rev = "0506d9b9c61d8d5415aaf6d85dfc302c7993555d";
      sha256 = "sha256-feIisv/oAtwRlGWNWF8UygwXVSf71+A7aczZQ71sB1A=";
    };
  });
}
