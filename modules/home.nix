{ pkgs, ... }: {
  home.username = "cirius";
  home.homeDirectory = "/home/cirius";

  home.packages = with pkgs; [
    ### Development
    # Tools
    vscode
    kitty
    cmake
    git
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
    google-chrome
  ];

  programs.home-manager = {
    enable = true;
  };

  programs.starship = {
    enable = true;
    settings = { };
  };

  programs.wezterm = {
    enable = true;
  };

  nixpkgs.config.allowUnfree = true;
  home.stateVersion = "23.11";
}
