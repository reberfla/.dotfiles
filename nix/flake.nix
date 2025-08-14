{
  description = "My MacOs config flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-24.11-darwin";
    nix-darwin.url = "github:nix-darwin/nix-darwin/nix-darwin-24.11";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs }:
  let
    configuration = { pkgs, ... }: {
      # List packages installed in system profile.
      environment.systemPackages =
        [ pkgs.vim
          pkgs.azure-cli
          pkgs.fzf
          pkgs.graphviz
          pkgs.jq
          pkgs.lazydocker
          pkgs.lazygit
          pkgs.lima
          pkgs.nmap
          pkgs.nodejs_22
          pkgs.pandoc
          pkgs.pngpaste
          pkgs.qemu
          pkgs.ripgrep
          pkgs.starship
          pkgs.stow
          pkgs.tmux
          pkgs.tree
          pkgs.uv
          pkgs.zoxide
          pkgs.zsh
          pkgs.xh
        ];

      nix.settings.experimental-features = "nix-command flakes";
      programs.zsh.enable = true;
      system.configurationRevision = self.rev or self.dirtyRev or null;
      system.stateVersion = 5;
      nixpkgs.hostPlatform = "aarch64-darwin";
      security.pam.enableSudoTouchIdAuth = true;

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
        };
        dock = {
          autohide = false;
          mru-spaces = false;
          show-recents = false;
          static-only = true;
          tilesize = 32;
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

      # Homebrew Casks and Taps
      homebrew = {
          enable = true;
          brews = [
            "zsh-autosuggestions"
            "zsh-syntax-highlighting"
            "neovim"
            "sdkman/tap/sdkman-cli"
          ];
          casks = [
              "1password"
              "dbeaver-community"
              "intellij-idea"
              "google-chrome"
              "postman"
              "wezterm"
              "obsidian"
              "docker"
              "spotify"
              "slack"
              "basictex"
            ];
          taps = [
              "sdkman/tap"
            ];
        };
    };
  in
  {
    darwinConfigurations."Flavio-MacBook-Pro" = nix-darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      modules = [ configuration ];
    };
    darwinConfigurations."DTCHZURIB302232" = nix-darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      modules = [ configuration ];
    };
  };
}
