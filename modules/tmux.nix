{...}:
{
  programs.tmux = {
    enable = true;
    clock24 = true;
    extraConfig = ''
      # ~/.tmux.conf

      # Options to make tmux more pleasant
      set -g mouse on
      set -g default-terminal "tmux-256color"

      # Configure the catppuccin plugin
      set -g @catppuccin_flavor "mocha"
      set -g @catppuccin_window_status_style "rounded"

      # Load catppuccin
      run ~/.config/tmux/plugins/catppuccin/tmux/catppuccin.tmux
      # For TPM, instead use `run ~/.config/tmux/plugins/tmux/catppuccin.tmux`

      # Make the status line pretty and add some modules
      set -g status-right-length 100
      set -g status-left-length 100
      set -g status-left ""
      set -g status-right "#{E:@catppuccin_status_application}"
      set -agF status-right "#{E:@catppuccin_status_cpu}"
      set -ag status-right "#{E:@catppuccin_status_session}"
      set -ag status-right "#{E:@catppuccin_status_uptime}"
      set -agF status-right "#{E:@catppuccin_status_battery}"

      run ~/.config/tmux/plugins/tmux-plugins/tmux-cpu/cpu.tmux
      run ~/.config/tmux/plugins/tmux-plugins/tmux-battery/battery.tmux
    '';
  };
}