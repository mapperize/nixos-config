{ plasma-manager, config, pkgs, ... }:

{
 programs.plasma = {
    enable = true;

    workspace = {
      clickItemTo = "open";
      lookAndFeel = "org.kde.breezedark.desktop";
      cursor = {
        theme = "Bibata-Modern-Ice";
        size = 32;
      };
      iconTheme = "Breeze";
      wallpaper = "${pkgs.kdePackages.plasma-workspace-wallpapers}/share/wallpapers/Patak/contents/images/1080x1920";
    };

    hotkeys.commands."launch-konsole" = {
      name = "Launch Konsole";
      key = "Meta+Alt+T";
      command = "konsole";
    };

    panels = [
      {
        location = "bottom";
        hiding = "none";
        widgets = [
          {
            name = "org.kde.plasma.kickoff";
            config = {
              General = {
                icon = "nix-snowflake-white";
                alphaSort = true;
              };
            };
          }

          {
            iconTasks = {
              launchers = [
                "applications:org.kde.dolphin.desktop"
                "applications:org.kde.konsole.desktop"
                "applications:helium.desktop"
              ];
            };
          }
          "org.kde.plasma.panelspacer"
          {
            systemTray.items = {
              shown = [
                "org.kde.plasma.battery"
                "org.kde.plasma.volume"
              ];
              hidden = [
                "org.kde.plasma.networkmanagement"
                "org.kde.plasma.bluetooth"
              ];
            };
          }
          {
            digitalClock = {
              time.format = "12h";
            };
          }
        ];
      }
    ];

    fonts.general = {
      family = "JetBrains Mono";
      pointSize = 12;
    };

    window-rules = [
      {
        description = "Dolphin";
        match = {
          window-class = { value = "dolphin"; type = "substring"; };
          window-types = [ "normal" ];
        };
        apply = {
          noborder = { value = true; apply = "force"; };
          maximizehoriz = true;
          maximizevert = true;
        };
      }
    ];

    powerdevil = {
      AC = {
        powerButtonAction = "lockScreen";
        autoSuspend = { action = "shutDown"; idleTimeout = 1000; };
        turnOffDisplay = { idleTimeout = 1000; idleTimeoutWhenLocked = "immediately"; };
      };
      battery = {
        powerButtonAction = "sleep";
        whenSleepingEnter = "standbyThenHibernate";
      };
      lowBattery = {
        whenLaptopLidClosed = "hibernate";
      };
    };

    kwin = {
      edgeBarrier = 0;
      cornerBarrier = false;
      scripts.polonium.enable = false;
    };

    kscreenlocker = {
      lockOnResume = true;
      timeout = 10;
    };
    configFile = {
      baloofilerc."Basic Settings"."Indexing-Enabled" = false;
      kwinrc."org.kde.kdecoration2".ButtonsOnLeft = "SF";
      kwinrc.Desktops.Number = { value = 8; immutable = true; };
      kscreenlockerrc = {
        Greeter.WallpaperPlugin = "org.kde.potd";
        "Greeter/Wallpaper/org.kde.potd/General".Provider = "bing";
      };
    };
  };

}
