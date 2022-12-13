self: super:

with super;

let
  dwmConfig = builtins.readFile(../overlays/configs/dwm.conf);
in
{
  dwm = super.dwm.overrideAttrs(oldAttrs: rec {
    pname = "dwm";
    version = "6.3";

    src = fetchurl {
      url = "https://dl.suckless.org/dwm/${pname}-${version}.tar.gz";
    };

    # src = super.fetchFromGitHub {
    #   owner = "FrengerH";
    #   repo = "dwm";
    #   rev = "d39e2f3441fe18aba8d1a62c08918a411ec6f237";
    #   sha256 = "sha256-pd1yi+DQ7xEV0iDyX+jC4KtcsfnqTH5ZOmPw++gSt8E=";
    # };

    patches = [
      ./patches/dwm.1.diff
      ./patches/dwm.c.diff
      ./patches/movestack.c.diff
      # ./patches/config.def.h.diff
    ];

    conf = dwmConfig;
  });
}
