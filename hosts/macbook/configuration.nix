{ pkgs, ... }: {
  nixpkgs.hostPlatform = "aarch64-darwin";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  environment.systemPackages = [
    pkgs.vim
    pkgs.git
  ];

  system.stateVersion = 6;
}
