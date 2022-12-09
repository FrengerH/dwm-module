self: super:

with super;

let

in
{
  tmuxPlugins.dracula = super.tmuxPlugins.dracula.overrideAttrs (old: {
    # src = super.fetchFromGitHub {
    #   owner = "FrengerH";
    #   repo = "tmux-dracula";
    #   rev = "04827984f10452b9ade2282d376352ead99d0130";
    #   sha256 = "VOCj7Ft2zlARjC8DZxgfIb4N+pFh3adZf0EzONL9rPI=";
    # };

    src = super.fetchFromGitHub {
      owner = "catppuccin";
      repo = "tmux";
      rev = "d9e5c6d1e3b2c6f6f344f7663691c4c8e7ebeb4c";
      sha256 = "sha256-k0nYjGjiTS0TOnYXoZg7w9UksBMLT+Bq/fJI3f9qqBg=";
    };
  });
}
