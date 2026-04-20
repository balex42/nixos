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

  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        normal.family = "JetBrains Mono";
        size = 12;
      };
      scrolling.history = 10000;
      window = {
        opacity = 0.95;
        padding = { x = 8; y = 8; };
      };
      terminal.shell = {
        program = "${pkgs.tmux}/bin/tmux";
        args = [ "new-session" "-A" "-s" "main" ];
      };
    };
  };

  programs.vscode = {
  enable = true;
  extensions = with pkgs.vscode-extensions; [
    mkhl.direnv
    jnoortheen.nix-ide
  ];
};
}
