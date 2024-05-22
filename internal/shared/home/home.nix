{ pkgs, ... }: {
  imports = [
    ./modules/shell.nix
    ./modules/nixlsp.nix
  ];
  home.packages = with pkgs; [
    ### Development
    # Tools
    vscode
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
    # Tools
    go-task
    # Shared libraries
    gnumake
    openssl
  ];
}
