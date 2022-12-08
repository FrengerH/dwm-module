self: super:

with super;

let
in
{
  dwm = super.dwm.overrideAttrs(oldAttrs: rec {
    src = fetchurl {
      url = "https://dl.suckless.org/dwm/dwm-6.3.tar.gz";
      sha256 = "03hirnj8saxnsfqiszwl2ds7p0avg20izv9vdqyambks00p2x44p";
    };

    patches = [
      ./patches/dwm.1.diff
      ./patches/dwm.c.diff
      ./patches/movestack.c.diff
      ./patches/config.def.h.diff
    ];
  });
}
