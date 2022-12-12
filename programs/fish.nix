{
  enable = true;
  shellAliases = {
    l="ls -lvh";
    ll="ls -lvAh";

    ab="tmux switch -t base";

    conf="cd ~/.config";
    projects="cd ~/projects";
    programming="cd ~/programming";

    ssh="TERM=xterm-256color /usr/bin/env ssh";
  };
  shellInit = ''
    set -gx XDG_CONFIG_HOME ~/.config/


    # preferred_background: 1e1e2e

    set -U fish_color_normal cdd6f4
    set -U fish_color_command 89b4fa
    set -U fish_color_param f2cdcd
    set -U fish_color_keyword f38ba8
    set -U fish_color_quote a6e3a1
    set -U fish_color_redirection f5c2e7
    set -U fish_color_end fab387
    set -U fish_color_error f38ba8
    set -U fish_color_gray 6c7086
    set -U fish_color_selection --background=313244
    set -U fish_color_search_match --background=313244
    set -U fish_color_operator f5c2e7
    set -U fish_color_escape f2cdcd
    set -U fish_color_autosuggestion 6c7086
    set -U fish_color_cancel f38ba8
    set -U fish_color_cwd f9e2af
    set -U fish_color_user 94e2d5
    set -U fish_color_host 89b4fa
    set -U fish_pager_color_progress 6c7086
    set -U fish_pager_color_prefix f5c2e7
    set -U fish_pager_color_completion cdd6f4
    set -U fish_pager_color_description 6c7086


    set -U fish_cursor_default block
    set -U fish_cursor_insert line
    set -U fish_cursor_replace_one underscore
    set -U fish_cursor_visual block
    set -U fish_cursor_unknow line

    function fish_mode_prompt
      switch $fish_bind_mode
        case default
          echo -en "\e[2 q"
          set_color f38ba8 #red
          echo "[N] "
        case insert
          echo -en "\e[6 q"
          set_color 94e2d5 #green
          echo "[I] "
        case replace_one
          echo -en "\e[4 q"
          set_color f9e2af #yellow
          echo "[R] "
        case visual
          echo -en "\e[2 q"
          set_color f2cdcd #magenta
          echo "[V] "
        case '*'
          echo -en "\e[2 q"
          set_color f38ba8 #red
          echo "[?] "
      end
      set_color normal
    end

    #if status is-interactive
        if string match -q -- 'tmux*' $TERM
            set -g fish_vi_force_cursor 1
        end
    #end

    function fish_user_key_bindings
      fish_vi_key_bindings --no-erase insert
      bind -M insert \cn accept-autosuggestion
      bind --preset -M insert \cl echo test
      #  bind --erase --preset -M insert \cl echo test
      bind -m insert v 'tmux copy-mode; commandline -f repaint-mode'
    end

    function fish_greeting
    end
  '';
}
