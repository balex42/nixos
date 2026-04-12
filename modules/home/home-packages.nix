{ config, pkgs, ... }: {
  home.packages = with pkgs; [
    keepass
    ripgrep
    claude-code
  ];

  programs.htop.enable = true;

  programs.tmux.enable = true;

  programs.ssh = {
    enable = true;
    addKeysToAgent = "yes";
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

  programs.vscode = {
  enable = true;
  extensions = with pkgs.vscode-extensions; [
    mkhl.direnv
    jnoortheen.nix-ide
  ];
};
}
