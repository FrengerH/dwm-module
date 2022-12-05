self: super:

with super;

let
in
{
  dwm = super.dwm.overrideAttrs(oldAttrs: rec {
    patches = [
      ./patches/dwm.1.diff
      ./patches/dwm.c.diff
      ./patches/movestack.c.diff
      ./patches/config.def.h.diff
    ];
  });
}
