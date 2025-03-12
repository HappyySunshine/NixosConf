{ pkgs, lib, hyprland, ... }: 
                                                                          
{
  wayland.windowManager.hyprland.enable = true;
 wayland.windowManager.hyprland.package = hyprland;
  wayland.windowManager.hyprland.settings = {
  input= {
    kb_layout = "br";
    kb_model = "nodeadkeys";
    follow_mouse = 1;
    sensitivity = 0; # -1.0 - 1.0, 0 means no modification.
        };   
  general = {
    gaps_in = 5;
    gaps_out = 20;
    border_size = 2;
            #  col.active_border = "rgba(33ccffee) rgba(00ff99ee) 45deg";
            # col.inactive_border = "rgba(595959aa)";
        };
  decoration = {
   inactive_opacity = 0.8;
    rounding = 20;
    # shadow_ignore_window = false;
   # dim_inactive = true
   # dim_strength = 0.8
    blur = {
        enabled = true;
        size = 3;
        passes = 1;
      #  popus = true
    };
    master = {
        # new_is_master= true;
            };
    # drop_shadow = yes;
    # shadow_range = 4;
    # shadow_render_power = 3;
    # col.shadow = "rgba(1a1a1aee)"
        };
    animations= {
        enabled = true;
        };
    misc ={
    force_default_wallpaper =0;
        };


    "$mod" = "SUPER";
    bind =
      [
        "$mod, A, fullscreen, 0"
        "$mod, Q, killactive"
        "$mod, Y, exec, wezterm"
        "$mod, G, exec, google-chrome-stable"
        "$mod, T, exec, alacritty"
        "$mod, F, exec, firefox"
        "$mod, D, exec, discord"
        "$mod, M, exec, prismlauncher"

        # "$mod, K, exec, kitty"
        "$mod, B, exec, pkill waybar"
        "$mod+CTRL, B, exec, waybar"

        ", Print, exec, grimblast copy area"
        "$mod+Shift, M, exit"
        "$mod, Q, killactive"
      ]
      ++ (
        # workspaces
        # binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
        builtins.concatLists (builtins.genList (
            x: let
              ws = let
                c = (x + 1) / 10;
              in
                builtins.toString (x + 1 - (c * 10));
            in [
              "$mod, ${ws}, workspace, ${toString (x + 1)}"
              "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
            ]
          )
          10)
      )
    ++ (
        builtins.concatLists (builtins.genList(
                    x: let 
                        keys = ["left" "right" "up" "down"];
                        keys2 = ["h" "l" "k" "j"];
                        dir = ["l" "r" "u" "d"];
                        
                        d = builtins.toString(
                            builtins.elemAt dir x
                        );
                        k = builtins.toString(
                            builtins.elemAt keys x
                        );
                        k2 = builtins.toString(
                            builtins.elemAt keys2 x
                        );
                        in 
                            [
                            "$mod, ${k}, movefocus, ${d}"
                            "$mod, ${k2}, movefocus, ${d}"
                            ]
                        )

                    4)

            );
      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
        ];

          windowrulev2 =[ 
            "bordercolor rgb(FFFF00), class:^(Alacritty)$"

        ];
  };
  wayland.windowManager.hyprland.extraConfig = ''
        submap = not_on_term
        bind= Alt, 1, workspace, 1
        bind= Alt, 2, workspace, 2
        bind= Alt, 3, workspace, 3
        submap = reset

    '';


}
