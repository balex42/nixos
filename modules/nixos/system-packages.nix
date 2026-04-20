{ config, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    vim
  ];

  fonts.packages = with pkgs; [
    jetbrains-mono
  ];

  programs.git.enable = true;

  programs.firefox.enable = true;

  virtualisation.podman = {
    enable = true;
  };
}
