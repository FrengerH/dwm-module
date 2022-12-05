self: super: 

with super; 

let

in
{
  st = super.st.overrideAttrs(olsattrs: rec {
    patches = [
      ./patches/st.diff
    ];
  });
}
