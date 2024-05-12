{ pkgs, ... }: {
  home.username = "cirius";
  home.homeDirectory = "/home/cirius";
  home.stateVersion = "23.11";
  programs.home-manager.enable = true;
}
