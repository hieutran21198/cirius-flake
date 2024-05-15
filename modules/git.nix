{ pkgs, ... }: {
  home.packages = with pkgs; [ ];

  programs.git = {
    enable = true;
    package = pkgs.gitAndTools.gitFull;

    userName = "Hieu Tran";
    userEmail = "hieu.tran21198@gmail.com";

    ignores = [ ".vscode/settings.json" ];

    extraConfig = {
      core = { whitespace = "trailing-space,space-before-tab"; };
      pull = { rebase = true; autostash = true; };
      diff = { algorithm = "patience"; };
      push = { autoSetupRemote = true; };
    };
  };
}
