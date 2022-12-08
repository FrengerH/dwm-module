{ pkgs }:

let
  powerTheme = builtins.toFile "power-theme.rasi" (builtins.readFile ../../themes/power-menu-theme.rasi);
  powerMenu = pkgs.writeShellScriptBin "powerMenu" ''
    THEME="${powerTheme}"
    rofi_command="rofi -no-config -theme $THEME"

    # Options
    shutdown="Shutdown"
    reboot="Reboot"
    lock="Lock"
    suspend="Suspend"
    logout="Logout"

    # Variable passed to rofi
    options="$lock\n$suspend\n$logout\n$reboot\n$shutdown"

    chosen="$(echo -e "$options" | $rofi_command -dmenu -selected-row 0)"

    case $chosen in
        $shutdown)
        systemctl poweroff
        ;;
        $reboot)
        systemctl reboot
        ;;
        $lock)
        $(which light-locker-comman) -l
        ;;
        $suspend)
        systemctl suspend
        ;;
        $logout)
        loginctl kill-session $XDG_SESSION_ID
        ;;
    esac
  '';
in
{
  path = "${powerMenu.outPath}/bin/powerMenu";
}
