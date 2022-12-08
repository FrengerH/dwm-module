self: super:

with super;

let
in
{
  dwm = super.dwm.overrideAttrs(oldAttrs: rec {
    src = super.fetchFromGitHub {
      owner = "FrengerH";
      repo = "dwm";
      rev = "d39e2f3441fe18aba8d1a62c08918a411ec6f237";
    };

    patches = [
      ./patches/dwm.1.diff
      ./patches/dwm.c.diff
      ./patches/movestack.c.diff
      ./patches/config.def.h.diff
    ];
  });
}
