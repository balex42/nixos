{ config, pkgs, lib, ... }: {
  nixpkgs.hostPlatform = "aarch64-darwin";

  nixpkgs.config.allowUnfree = true;

  nix.enable = false;

  users.users.alex = {
    name = "alex";
    home = "/Users/alex";
  };

  environment.systemPackages = [
    pkgs.vim
    pkgs.git
  ];

  system.stateVersion = 6;

  system.activationScripts.applications.text = pkgs.lib.mkForce ''
    echo "setting up /Applications/Nix Apps..." >&2
    rm -rf "/Applications/Nix Apps"
    mkdir -p "/Applications/Nix Apps"
    find ${config.system.build.applications}/Applications -maxdepth 1 -type l \
      -exec readlink '{}' + |
    while read -r src; do
      app_name=$(basename "$src")
      /bin/ln -sfn "$src" "/Applications/Nix Apps/$app_name"
    done
  '';
}
