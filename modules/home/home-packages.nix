{ config, pkgs, ... }: {
  home.packages = with pkgs; [
    keepass
    ripgrep
    htop
    tmux
    claude-code
  ];

  programs.vim = {
    enable = true;
    extraConfig = builtins.readFile ./vim/vimrc;
  };
}
