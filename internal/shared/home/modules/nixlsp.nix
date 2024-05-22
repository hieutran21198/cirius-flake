{ pkgs, ... }: {
  home.packages = with pkgs; [
    deadnix
    nixpkgs-fmt
    nixfmt-rfc-style
    statix
  ];
}
