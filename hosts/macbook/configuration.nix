{ config, pkgs, lib, ... }: {
  nixpkgs.hostPlatform = "aarch64-darwin";

  nixpkgs.config.allowUnfree = true;

  nix.enable = false;

  users.users.alex = {
    name = "alex";
    home = "/Users/alex";
  };

  system.primaryUser = "alex";

  environment.systemPackages = with pkgs;[
    vim
    git
    docker
    docker-compose
    colima
  ];

  launchd.user.agents.colima = {
    command = "${pkgs.colima}/bin/colima start --foreground";
    serviceConfig = {
      KeepAlive = true;
      RunAtLoad = true;
      StandardOutPath = "/tmp/colima.out.log";
      StandardErrorPath = "/tmp/colima.err.log";
    };
    path = [ pkgs.docker pkgs.coreutils ];
  };

  system.stateVersion = 6;

  system.activationScripts.applications.text = pkgs.lib.mkForce ''
    echo "setting up /Applications/Nix Apps..." >&2
    rm -rf "/Applications/Nix Apps"
    mkdir -p "/Applications/Nix Apps"
    find ${config.system.build.applications}/Applications -maxdepth 1 -type l \
      -exec readlink '{}' + |
    while read -r src; do
      app_name=$(basename "$src")
      echo "copying $app_name" >&2
      ${pkgs.rsync}/bin/rsync -a --delete "$src/" "/Applications/Nix Apps/$app_name"
    done
  '';

  nixpkgs.overlays = [
    (final: prev: {
      direnv = prev.direnv.overrideAttrs (_: { doCheck = false; });
    })
  ];
}
