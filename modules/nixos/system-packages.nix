{ config, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    vim
  ];

  programs.git = {
    enable = true;
    userName  = "balex42";
    userEmail = "alex@bien.koeln";
  };

  programs.firefox.enable = true;

  virtualisation.podman = {
    enable = true;
  };
}
