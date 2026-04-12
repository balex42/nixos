{ config, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    vim
  ];

  programs.git.enable = true;

  programs.firefox.enable = true;

  virtualisation.podman = {
    enable = true;
  };
}
