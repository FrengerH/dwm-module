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

    set -g fish_term24bit 1

    # preferred_background: 1e1e2e

    # Dracula Color Palette
    set -l foreground f8f8f2    #f8f8f2
    set -l selection 44475a     #44475a
    set -l comment 6272a4       #6272a4
    set -l red ff5555           #ff5555
    set -l orange ffb86c        #ffb86c
    set -l yellow f1fa8c        #f1fa8c
    set -l green 50fa7b         #50fa7b
    set -l purple bd93f9        #bd93f9
    set -l cyan 8be9fd          #8be9fd
    set -l pink ff79c6          #ff79c6

    # Syntax Highlighting Colors
    set -gx fish_color_normal $foreground
    set -gx fish_color_command $cyan
    set -gx fish_color_keyword $pink
    set -gx fish_color_quote $yellow
    set -gx fish_color_redirection $foreground
    set -gx fish_color_end $orange
    set -gx fish_color_error $red
    set -gx fish_color_param $purple
    set -gx fish_color_comment $comment
    set -gx fish_color_selection --background=$selection
    set -gx fish_color_search_match --background=$selection
    set -gx fish_color_operator $green
    set -gx fish_color_escape $pink
    set -gx fish_color_autosuggestion $comment
    set -gx fish_color_cancel $red --reverse
    set -gx fish_color_option $orange

    # Default Prompt Colors
    set -gx fish_color_cwd $green
    set -gx fish_color_host $purple
    set -gx fish_color_host_remote $purple
    set -gx fish_color_user $cyan

    # Completion Pager Colors
    set -gx fish_pager_color_progress $comment
    set -gx fish_pager_color_background
    set -gx fish_pager_color_prefix $cyan
    set -gx fish_pager_color_completion $foreground
    set -gx fish_pager_color_description $comment
    set -gx fish_pager_color_selected_background --background=$selection
    set -gx fish_pager_color_selected_prefix $cyan
    set -gx fish_pager_color_selected_completion $foreground
    set -gx fish_pager_color_selected_description $comment
    set -gx fish_pager_color_secondary_background
    set -gx fish_pager_color_secondary_prefix $cyan
    set -gx fish_pager_color_secondary_completion $foreground
    set -gx fish_pager_color_secondary_description $comment


    set -U fish_cursor_default block
    set -U fish_cursor_insert line
    set -U fish_cursor_replace_one underscore
    set -U fish_cursor_visual block
    set -U fish_cursor_unknow line

    function fish_mode_prompt
      switch $fish_bind_mode
        case default
          echo -en "\e[2 q"
          set_color red #red
          echo "[N] "
        case insert
          echo -en "\e[6 q"
          set_color green #green
          echo "[I] "
        case replace_one
          echo -en "\e[4 q"
          set_color yellow #yellow
          echo "[R] "
        case visual
          echo -en "\e[2 q"
          set_color purple #magenta
          echo "[V] "
        case '*'
          echo -en "\e[2 q"
          set_color red #red
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
