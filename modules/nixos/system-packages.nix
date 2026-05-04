{ config, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    vim
    brave
    kubectl
  ];

  programs.git.enable = true;

  programs.firefox.enable = true;

  virtualisation.podman.enable = false;

  virtualisation.docker.enable = true;
}
