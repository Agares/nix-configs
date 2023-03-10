{ lib, modulesPath, pkgs, ... }:
{
  # colors: https://coolors.co/ff1885-19323c-9da2ab-f3de8a-988f2a
  config = {
    home-manager.users.ramona = {
      programs.firefox.enable = true;
      programs.alacritty.enable = true;

      home.packages = with pkgs; [
        keepassxc
        discord
        virt-manager
        pavucontrol
        looking-glass-client
        pamixer
        playerctl
        xdg-utils
        joplin-desktop
        dconf
        moc
        grip
        flac
        spotify
      ];

      home.pointerCursor = {
        name = "Adwaita";
        package = pkgs.gnome.adwaita-icon-theme;
        size = 36;
        x11 = {
          enable = true;
          defaultCursor = "Adwaita";
        };
      };

      programs.vscode = {
        enable = true;
        package = pkgs.vscode.fhsWithPackages (ps: with ps; [ pkg-config ]);
        extensions = with pkgs.vscode-extensions; [
          timonwong.shellcheck
          tamasfe.even-better-toml
        ];
      };

      gtk = {
        enable = true;
        theme = {
          package = pkgs.dracula-theme;
          name = "Dracula";
        };
      };

      qt = {
        enable = true;
        style.name = "Dracula";
      };

      wayland.windowManager.sway = {
        enable = true;
        config = {
          terminal = "alacritty";
          modifier = "Mod4";
          output = {
            "Dell Inc. DELL U2720Q JKPQT83" = {
              scale = "2";
              pos = "1920 0";
            };
            "Dell Inc. DELL U2415 7MT0186418CU" = { pos = "3840 0"; };
            "Dell Inc. DELL U2415 XKV0P9C334FS" = { pos = "0 0"; };
          };
          bars = [
            {
              position = "top";
              statusCommand = "while ${./scripts/swaybar.sh}; do sleep 1; done";
              fonts = {
                names = [ "Noto Sans" "Iosevka" ];
                size = 11.0;
              };
              colors = {
                activeWorkspace = {
                  background = "#19323C";
                  border = "#988F2A";
                  text = "#9DA2AB";
                };
                focusedWorkspace = {
                  background = "#19323C";
                  border = "#988F2A";
                  text = "#FF1885";
                };
              };
            }
          ];
          colors = {
            focused = {
              background = "#19323C";
              border = "#00000000";
              text = "#9DA2AB";
              indicator = "#988F2A";
              childBorder = "#00000000";
            };
          };
        };
        extraConfig = ''
          input * {
            xkb_layout "pl,de"
            xkb_options "grp:win_space_toggle"
          }
          bindsym XF86AudioRaiseVolume exec 'pactl set-sink-volume @DEFAULT_SINK@ +5%'
          bindsym XF86AudioLowerVolume exec 'pactl set-sink-volume @DEFAULT_SINK@ -5%'
          bindsym XF86AudioMute exec 'pactl set-sink-mute @DEFAULT_SINK@ toggle'
        '';
      };
    };

    users.users.ramona = {
      extraGroups = [ "libvirtd" ];
    };
  };
}
