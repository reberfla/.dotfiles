{
  description = "My MacOs config flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-24.11-darwin";
    nix-darwin.url = "github:nix-darwin/nix-darwin/nix-darwin-24.11";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs }:
  let
      commonPackages = pkgs: [
        pkgs.fzf
        pkgs.graphviz
        pkgs.jq
        pkgs.lazydocker
        pkgs.lazygit
        pkgs.nmap
        pkgs.pngpaste
        pkgs.ripgrep
        pkgs.rustup
        pkgs.starship
        pkgs.stow
        pkgs.tldr
        pkgs.tmux
        pkgs.tree
        pkgs.uv
        pkgs.zoxide
        pkgs.zsh
        pkgs.xh
      ];

    commonBrews = [
          "zsh-autosuggestions"
          "zsh-syntax-highlighting"
          "neovim"
          "sdkman/tap/sdkman-cli"
        ];
    commonCasks = [
        "intellij-idea"
        "docker-desktop"
        "postman"
        "wezterm"
        "obsidian"
        "spotify"
        "nikitabobko/tap/aerospace"
        "google-chrome"
        "dbvisualizer"
      ];
    commonTaps = [
        "sdkman/tap"
        "nikitabobko/tap"
      ];

    commonDarwinModule = { pkgs, ... }: {
      nix.settings.experimental-features = "nix-command flakes";
      programs.zsh.enable = true;
      system.configurationRevision = self.rev or self.dirtyRev or null;
      system.stateVersion = 5;
      nixpkgs.hostPlatform = "aarch64-darwin";
      security.pam.enableSudoTouchIdAuth = true;

      environment.systemPackages = commonPackages pkgs;
      homebrew = {
        enable = true;
        onActivation = {
            autoUpdate = true;
            cleanup = "uninstall";
            upgrade = true;
          };
        brews = commonBrews;
        taps = commonTaps;
        casks = commonCasks;
      };

      # MacOs System Settings
      system.defaults = {
        NSGlobalDomain = {
          AppleInterfaceStyle = "Dark";
          AppleShowScrollBars = "Always";
          AppleScrollerPagingBehavior = true;
          NSAutomaticWindowAnimationsEnabled = false;
          "com.apple.mouse.tapBehavior" = 1;
          AppleMeasurementUnits = "Centimeters";
          AppleMetricUnits = 1;
          AppleTemperatureUnit = "Celsius";
          AppleShowAllFiles = true;
          NSWindowShouldDragOnGesture = true;
        };
        dock = {
          autohide = true;
          autohide-delay = 1000.0;
          tilesize = 32;
          mru-spaces = false;
          show-recents = false;
          static-only = true;
        };
        finder = {
          AppleShowAllExtensions = true;
          ShowPathbar = true;
          FXPreferredViewStyle = "clmv";
        };
        screencapture.target = "clipboard";
        screensaver.askForPasswordDelay = 10;
      };
      system.keyboard = {
          enableKeyMapping = true;
          swapLeftCommandAndLeftAlt = false;
        };
    };
  in
  {
    darwinConfigurations."Flavio-MacBook-Pro" = nix-darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      modules = [ 
        commonDarwinModule
        ({ pkgs, ... }: {
            environment.systemPackages = [
              pkgs.azure-cli
              pkgs.lima
              pkgs.nmap
              pkgs.pandoc
              pkgs.qemu
            ];
            homebrew.casks = [
                "1password"
                "obsidian"
                "basictex"
                "dotnet-sdk@9"
              ];
            homebrew.brews = [
              "node@22"
            ];
          })];
    };
    darwinConfigurations."DTCHZURIB302232" = nix-darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      modules = [ 
        commonDarwinModule
        ({ pkgs, ...}: {
            environment.systemPackages = [
              pkgs.awscli2
            ];
            homebrew.casks = [
                "slack"
              ];
      })];
    };
  };
}
