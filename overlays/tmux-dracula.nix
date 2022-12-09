self: super:

with super;

let

in
{
  tmuxPlugins.dracula = super.tmuxPlugins.dracula.overrideAttrs (old: {
    src = super.fetchFromGitHub {
      owner = "FrengerH";
      repo = "tmux-dracula";
      rev = "d2e980e9fc625bc8ca9391811c2aaa6be91dc5cf";
      sha256 = "";
    };
  });
}
