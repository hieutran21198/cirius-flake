{ pkgs, ... }: {
  imports = [
    ./modules/hyprland.nix
  ];

  home.username = "cirius";
  home.homeDirectory = "/home/cirius";

  home.packages = with pkgs; [
    ### Development
    # Tools
    vscode
    kitty
    cmake
    gh
    # Devops
    awscli2
    # Languages
    go
    nodejs
    rustup
    ruby
    python312
    python312Packages.pip
    # Formatting & Linting
    shellharden
    deadnix
    nixpkgs-fmt
    nixfmt-rfc-style
    statix
    # Tools
    go-task
    # Shared libraries
    gnumake
    openssl

    ### Utilities
    # Terminal applications
    ocs-url
    btop
    eza
    wget
    ripgrep
    unzip
    fzf
    fd
    fastfetch
    cloudflare-warp

    ### Another GUI applications
    telegram-desktop
    spotify
    kdePackages.dolphin
    gwenview
    kate
    pavucontrol
    # browsers
    firefox
    microsoft-edge
  ];

  programs.home-manager = {
    enable = true;
  };

  programs.wezterm = {
    enable = true;
  };

  nixpkgs.config.allowUnfree = true;
  home.stateVersion = "23.11";
}
