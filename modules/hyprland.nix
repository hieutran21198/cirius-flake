{ pkgs, ... }: {
  home.packages = with pkgs; [
    rofi-wayland
    dunst
    wl-clipboard
    slurp
    cliphist
    swww
    ranger
    hyprpaper
    paleta
    python312Packages.colorthief
    kdePackages.kcolorpicker
    dipc
    libnotify
  ];

  programs.waybar = {
    enable = true;
    package = pkgs.waybar;
  };
}
