{ pkgs, ... }: {
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
}
