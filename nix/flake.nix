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
          pkgs.coursier
          pkgs.fzf
          pkgs.gradle
          pkgs.graphviz
          pkgs.jq
          pkgs.lazydocker
          pkgs.lazygit
          pkgs.lima
          pkgs.nmap
          # pkgs.neovim
          pkgs.nodejs_23
          pkgs.pandoc
          pkgs.pngpaste
          pkgs.qemu
          pkgs.ripgrep
          pkgs.starship
          pkgs.stow
          pkgs.tmux
          pkgs.tree
          pkgs.zoxide
          pkgs.zsh
          # pkgs.zsh-autosuggestions
          # pkgs.zsh-syntax-highlighting
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
        };
        dock = {
          autohide = true;
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

      # Homebrew Casks and Taps
      homebrew = {
          enable = true;
          brews = [
            "zsh-autosuggestions"
            "zsh-syntax-highlighting"
            "neovim"
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
              "basictex"
            ];
          taps = [
              "sdkman/tap"
            ];
        };
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#MacbookPro-2
    darwinConfigurations."Flavio-MacBook-Pro" = nix-darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      modules = [ configuration ];
    };
  };
}
