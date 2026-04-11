{ config, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    vim
    git
  ];

  programs.firefox.enable = true;

  virtualisation.podman = {
    enable = true;
  };
}
