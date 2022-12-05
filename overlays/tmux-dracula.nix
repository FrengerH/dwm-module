self: super:

with super;

let

in
{
  tmuxPlugins.dracula = super.tmuxPlugins.dracula.overrideAttrs (old: {
    src = super.fetchFromGitHub {
      owner = "FrengerH";
      repo = "tmux-dracula";
      rev = "04827984f10452b9ade2282d376352ead99d0130";
      sha256 = "VOCj7Ft2zlARjC8DZxgfIb4N+pFh3adZf0EzONL9rPI=";
    };
  });
}
