{ pkgs, lib, ... }: {
  home.packages = with pkgs; [
    ### Utilities
    btop
    eza
    wget
    ripgrep
    unzip
    fzf
    fd
    fastfetch
  ];

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

  programs.starship = {
    enable = true;
    enableBashIntegration = false;
    enableFishIntegration = true;
    settings = {
      add_newline = false;
      format = lib.concatStrings [
        "$username"
        "$hostname"
        "$directory"
        "$git_branch"
        "$git_commit"
        "$git_state"
        "$git_status"
        "$package"
        "$haskell"
        "$python"
        "$rust"
        "$nix_shell"
        "$line_break"
        "$jobs"
        "$character"
      ];
      nix_shell.symbol = "❄️ ";
    };
  };
}
