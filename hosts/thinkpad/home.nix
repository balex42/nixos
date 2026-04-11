{ config, pkgs, ... }: {
  imports = [ ../../modules/home/home-packages.nix ];

  home.username = "alex";
  home.homeDirectory = "/home/alex";
  home.stateVersion = "24.11";
}
