{pkgs-unstable, ...}: {
  programs.waybar = {
    enable = true;
    package = pkgs-unstable.waybar;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        mod = "dock";
        exclusive = true;
        passthrough = false;
        gtk-layer-shell = true;
        height = 0;
        modules-left = ["clock" "hyprland/workspaces"];
        modules-center = ["custom/uptime"];
        modules-right = ["pulseaudio" "temperature" "cpu" "memory" "tray"];
        clock = {
          format = "{:%b %d - %H:%M}";
          tooltip = false;
        };
        "hyprland/workspaces" = {
        };
        "custom/uptime" = {
          exec = ./uptime.sh;
          interval = "60";
          tooltip = false;
          format = "{}";
        };
        pulseaudio = {
          format = "<span color='#cba6f7'>{icon}</span>{volume}%";
          tooltip = false;
          format-muted = "<span color='#f38ba8'> </span>Muted";
          format-icons = {
            default = [" " " " " "];
          };
          on-click = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
          scroll-step = 5;
        };
        temperature = {
          tooltip = false;
          format = "<span color='#ea76cb'>{icon}</span> {temperatureC}°C";
          format-icons = [
            ""
            ""
            ""
            ""
            ""
            ""
          ];
        };
        cpu = {
          format = "<span color='#eba0ac'>{icon}</span>{usage}%";
          format-icons = [
            " "
            "󰪞 "
            "󰪟 "
            "󰪠 "
            "󰪡 "
            "󰪢 "
            "󰪣 "
            "󰪤 "
            "󰪥 "
          ];
          tooltip = false;
        };
        memory = {
          format = "<span color='#fab387'>{icon}</span>{used}/{total}";
          format-icons = [
            " "
            "󰪞 "
            "󰪟 "
            "󰪠 "
            "󰪡 "
            "󰪢 "
            "󰪣 "
            "󰪤 "
            "󰪥 "
          ];
          tooltip = false;
        };
      };
    };
    style = ./style.css;
  };
}
