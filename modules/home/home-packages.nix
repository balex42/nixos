{ config, pkgs, ... }: {
  home.packages = with pkgs; [
    keepass
    ripgrep
    htop
    tmux
    claude-code
  ];

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.vim = {
    enable = true;
    extraConfig = builtins.readFile ./vim/vimrc;
  };

  programs.vscode = {
  enable = true;
  extensions = with pkgs.vscode-extensions; [
    mkhl.direnv
    jnoortheen.nix-ide
  ];
};
}
