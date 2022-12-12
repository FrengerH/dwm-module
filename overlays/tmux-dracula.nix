self: super:

with super;

let

in
{
  tmuxPlugins.dracula = super.tmuxPlugins.dracula.overrideAttrs (old: {
    src = super.fetchFromGitHub {
      owner = "FrengerH";
      repo = "tmux-dracula";
      rev = "fa5ff39f8ed920ed6d4a7786ca4b8da2ac57125f";
      sha256 = "";
    };
  });
}
