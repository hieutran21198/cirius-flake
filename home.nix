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

    ### Desktop environment
    kdePackages.qtstyleplugin-kvantum
    kdePackages.polkit-kde-agent-1
    kdePackages.qt6ct
    kdePackages.qtwayland
    waybar
    rofi-wayland
    dunst
    wl-clipboard
    slurp # https://wiki.hyprland.org/0.22.0beta/Useful-Utilities/Screen-Sharing/
    cliphist # https://wiki.hyprland.org/0.22.0beta/Useful-Utilities/Clipboard-Managers/
    swww
    ranger
    hyprpaper
    paleta
    python312Packages.colorthief
    kdePackages.kcolorpicker
    dipc
    libnotify

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

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # disable greeting
      bass . "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"
      fastfetch
    '';
    shellInit = ''
      source $HOME/.profile.fish

      starship init fish | source
    '';
    plugins = [
      {
        name = "bass";
        src = pkgs.fishPlugins.bass.src;
      }
      {
        name = "z";
        src = pkgs.fishPlugins.z.src;
      }
      {
        name = "fzf-fish";
        src = pkgs.fishPlugins.fzf-fish.src;
      }
      {
        name = "autopair";
        src = pkgs.fishPlugins.autopair.src;
      }
      {
        name = "async-prompt";
        src = pkgs.fishPlugins.async-prompt.src;
      }
      {
        name = "done";
        src = pkgs.fishPlugins.done.src;
      }
      {
        name = "forgit";
        src = pkgs.fishPlugins.forgit.src;
      }
    ];
    shellAliases = { };
    package = pkgs.fish.override ({ usePython = true; });
  };

  nixpkgs.config.allowUnfree = true;
  home.stateVersion = "23.11";
}
