{ config, pkgs, ... }: {
  home.packages = with pkgs; [
    ripgrep
    claude-code
  ] ++ lib.optional pkgs.stdenv.isLinux keepass;

  programs.htop.enable = true;

  home.sessionVariables.EDITOR = "vim";

  programs.tmux = {
    enable = true;
    keyMode = "vi";
  };

  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    matchBlocks."*" = {
      addKeysToAgent = "yes";
    };
  };
  services.ssh-agent.enable = true;

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.vim = {
    enable = true;
    extraConfig = builtins.readFile ./vim/vimrc;
  };

  programs.ghostty = {
    enable = true;
    settings = {
      font-family = "JetBrains Mono";
      font-size = 12;
      scrollback-limit = 10000;
      background-opacity = 0.95;
      window-padding-x = 8;
      window-padding-y = 8;
      command = "${pkgs.tmux}/bin/tmux new-session -A -s main";
    };
  };

  programs.vscode = {
    enable = true;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      ms-vscode-remote.remote-containers
      mkhl.direnv
      jnoortheen.nix-ide
    ];
  };
}
