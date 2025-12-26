{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [
    
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland;
    systemd.enable = true;

    settings = {
      "$mod" = "SUPER";

      "$terminal" = "foot";
      "$browser"  = "firefox";
      "$fileman"  = "nautilus";
      "$menu"     = "wofi --show drun";
      "$editor"   = "code";

      exec-once = [
        "/config/dots/gui/hypr/scripts/wallpaper.sh"
        "ags run /config/dots/gui/ags/config/app.ts"
      ];

      general = {
        gaps_in = 4;
        gaps_out = 4;
        border_size = 2;
        "col.active_border" = "rgb(74c7ec)";
      };

      decoration = {
        rounding = 4;
        active_opacity = 0.9;
        inactive_opacity = 0.9;

        shadow.enabled = false;

        blur = {
          enabled = true;
          size = 8;
          passes = 1;
        };
      };

      animations = {
        enabled = true;

        bezier = [
          "easeOutQuint,0.23,1,0.32,1"
          "easeInOutCubic,0.65,0.05,0.36,1"
          "linear,0,0,1,1"
          "almostLinear,0.5,0.5,0.75,1.0"
          "quick,0.15,0,0.1,1"
        ];

        animation = [
          "global, 1, 10, default"
          "border, 1, 5.39, easeOutQuint"
          "windows, 1, 4.79, easeOutQuint"
          "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
          "windowsOut, 1, 1.49, linear, popin 87%"
          "fadeIn, 1, 1.73, almostLinear"
          "fadeOut, 1, 1.46, almostLinear"
          "fade, 1, 3.03, quick"
          "layers, 1, 3.81, easeOutQuint"
          "layersIn, 1, 4, easeOutQuint, fade"
          "layersOut, 1, 1.5, linear, fade"
          "fadeLayersIn, 1, 1.79, almostLinear"
          "fadeLayersOut, 1, 1.39, almostLinear"
          "workspaces, 1, 1.94, almostLinear, fade"
          "workspacesIn, 1, 1.21, almostLinear, fade"
          "workspacesOut, 1, 1.94, almostLinear, fade"
          "zoomFactor, 1, 7, quick"
        ];
      };

      windowrulev2 = [
        "opacity 1.0 override, class:firefox, fullscreen:1"
      ];

      input = {
        kb_layout = "gb";
        kb_options = "compose:rctrl";

        touchpad.natural_scroll = true;
      };

      monitor = [
        ",preferred,auto,1"
      ];

      bind = [
        "$mod,        Return, exec, $terminal"
        "$mod,        W,      exec, $browser"
        "$mod,        C,      exec, $editor"
        "$mod,        D,      exec, discord"
        "$mod,        S,      exec, spotify"
        "$mod,        K,      exec, krita"

        "$mod SHIFT,  Q,      killactive"
        "$mod SHIFT,  Escape, exec, hyprctl dispatch exit"
        "$mod SHIFT,  Delete, exec, poweroff"
        "$mod,        L,      exec, hyprlock"

        "$mod,        1,      workspace, 1"
        "$mod,        2,      workspace, 2"
        "$mod,        3,      workspace, 3"
        "$mod,        4,      workspace, 4"
        "$mod,        5,      workspace, 5"
        "$mod,        6,      workspace, 6"
        "$mod,        7,      workspace, 7"
        "$mod,        8,      workspace, 8"
        "$mod,        9,      workspace, 9"
        "$mod,        0,      workspace, 10"

        "$mod SHIFT,  1,      movetoworkspace, 1"
        "$mod SHIFT,  2,      movetoworkspace, 2"
        "$mod SHIFT,  3,      movetoworkspace, 3"
        "$mod SHIFT,  4,      movetoworkspace, 4"
        "$mod SHIFT,  5,      movetoworkspace, 5"
        "$mod SHIFT,  6,      movetoworkspace, 6"
        "$mod SHIFT,  7,      movetoworkspace, 7"
        "$mod SHIFT,  8,      movetoworkspace, 8"
        "$mod SHIFT,  9,      movetoworkspace, 9"
        "$mod SHIFT,  0,      movetoworkspace, 10"

        "$mod,        Up,     movefocus, u"
        "$mod,        Down,   movefocus, d"
        "$mod,        Left,   movefocus, l"
        "$mod,        Right,  movefocus, r"

        "$mod SHIFT,  Up,     exec, hyprctl keyword input:touchdevice:transform 0 && hyprctl keyword monitor ,preferred,auto,1,transform,0"
        "$mod SHIFT,  Down,   exec, hyprctl keyword input:touchdevice:transform 2 && hyprctl keyword monitor ,preferred,auto,1,transform,2"
        "$mod SHIFT,  Left,   exec, hyprctl keyword input:touchdevice:transform 1 && hyprctl keyword monitor ,preferred,auto,1,transform,1"
        "$mod SHIFT,  Right,  exec, hyprctl keyword input:touchdevice:transform 3 && hyprctl keyword monitor ,preferred,auto,1,transform,3"

        "$mod,        I,      exec, hyprctl keyword input:touchdevice:enabled true"
        "$mod SHIFT,  I,      exec, hyprctl keyword input:touchdevice:enabled false"

        ",Print,              exec, grimshot copy anything"
      ];

      bindel = [
        ",XF86AudioRaiseVolume,   exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume,   exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86AudioMute,          exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86AudioMicMute,       exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ",XF86AudioPlay,          exec, playerctl play-pause"
        ",XF86AudioNext,          exec, playerctl next"
        ",XF86AudioPrev,          exec, playerctl previous"
        ",XF86MonBrightnessUp,    exec, brightnessctl -n5 set 5%+"
        ",XF86MonBrightnessDown,  exec, brightnessctl -n5 set 5%-"
      ];
    };
  };
}