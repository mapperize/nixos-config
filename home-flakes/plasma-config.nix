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
      wallpaper = "${pkgs.kdePackages.plasma-workspace-wallpapers}/share/wallpapers/Patak/contents/images/1080x1920";
      iconTheme = "breeze";
    };

    hotkeys.commands = {
        "launch-konsole" = {
          name = "Launch Konsole";
          key = "Meta+Alt+T";
          command = "konsole";
        };

        "spectactle" = {
          name = "Launch Spectactle";
          key = "Insert";
          command = "spectacle";
        };
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
      "ksmserverrc"."General" = {
        loginMode = "emptySession";
      };
    };
  };

  home.packages = with pkgs; [
    kdePackages.breeze-icons
    kdePackages.breeze
  ];

}
