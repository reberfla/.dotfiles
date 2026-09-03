{
  description = "My MacOs config flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-26.05-darwin";
    nix-darwin.url = "github:nix-darwin/nix-darwin/nix-darwin-26.05";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs }:

  let
    configuration = { pkgs, ... }: {
        environment.systemPackages = [
        pkgs.azure-cli
        pkgs.dotnet-sdk_10
        pkgs.fzf
        pkgs.graphviz
        pkgs.jq
        pkgs.lazydocker
        pkgs.lazygit
        pkgs.nmap
        pkgs.pandoc
        pkgs.pngpaste
        pkgs.qemu
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

      nix.settings.experimental-features = "nix-command flakes";
      programs.zsh.enable = true;
      system.primaryUser="flavioreber";
      system.configurationRevision = self.rev or self.dirtyRev or null;
      system.stateVersion = 5;
      nixpkgs.hostPlatform = "aarch64-darwin";


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
      homebrew = {
        enable = true;
        onActivation = {
          autoUpdate = true;
          cleanup = "uninstall";
          upgrade = true;
        };
        brews = [
          "zsh-autosuggestions"
          "zsh-syntax-highlighting"
          "neovim"
          "docker"
          "sdkman/tap/sdkman-cli"
          "node"
        ];
        casks = [
          "intellij-idea"
          "docker-desktop"
          "postman"
          "wezterm"
          "obsidian"
          "spotify"
          "nikitabobko/tap/aerospace"
          "google-chrome"
          "1password"
          "obsidian"
          "basictex"
          "proton-pass"
        ];
        taps = [
          "sdkman/tap"
          "nikitabobko/tap"
        ];
      };
    };
  in
  {
    darwinConfigurations."Flavio-MacBook-Pro" = nix-darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      modules = [ configuration ];
      };
  };
}
