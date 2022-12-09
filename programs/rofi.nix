{ symlinkJoin, lib, rofi-unwrapped, makeWrapper, wrapGAppsHook, gdk-pixbuf, hicolor-icon-theme, theme ? null, plugins ? [], symlink-dmenu ? true, name ? "rofit" }:

symlinkJoin {
  name = "${name}-${rofi-unwrapped.version}";

  paths = [
    rofi-unwrapped.out
  ] ++ (lib.forEach plugins (p: p.out));

  nativeBuildInputs = [ makeWrapper wrapGAppsHook ];
  buildInputs = [ gdk-pixbuf ];

  preferLocalBuild = true;
  passthru.unwrapped = rofi-unwrapped;

  dontWrapGApps = true;

  postBuild = ''
    rm -rf $out/bin
    mkdir $out/bin
    ln -s ${rofi-unwrapped}/bin/* $out/bin
    rm $out/bin/${name}

    gappsWrapperArgsHook
    makeWrapper ${rofi-unwrapped}/bin/${name} $out/bin/${name} \
      ''${gappsWrapperArgs[@]} \
      --prefix XDG_DATA_DIRS : ${hicolor-icon-theme}/share \
      ${lib.optionalString (plugins != []) ''--prefix XDG_DATA_DIRS : ${lib.concatStringsSep ":" (lib.forEach plugins (p: "${p.out}/share"))}''} \
      ${lib.optionalString (theme != null) ''--add-flags "-theme ${theme}"''} \
      ${lib.optionalString (plugins != []) ''--add-flags "-plugin-path $out/lib/${name}"''}

    ${lib.optionalString symlink-dmenu "ln -s ${rofi-unwrapped}/bin/${name} $out/bin/dmenu"}
    rm $out/bin/rofi-theme-selector
  '';

  meta = rofi-unwrapped.meta // {
    priority = (rofi-unwrapped.meta.priority or 0) - 1;
  };
}

