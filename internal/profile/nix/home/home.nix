{ pkgs, ... }: {
  imports = [
    ./modules/hyprland/hyprland.nix
    ./modules/git.nix
  ];

  home.username = "cirius";
  home.homeDirectory = "/home/cirius";

  home.packages = with pkgs; [
    ### Utilities
    # Terminal applications
    cloudflare-warp
    kitty
    wezterm
    alacritty

    ### Another GUI applications
    ocs-url
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

  nixpkgs.config.allowUnfree = true;
  home.stateVersion = "23.11";
}
