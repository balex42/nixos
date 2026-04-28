{ config, pkgs, lib, ... }: {
  imports = [ ../../modules/home/home-packages.nix ];

  home.username = "alex";
  home.homeDirectory = "/Users/alex";
  home.stateVersion = "24.11";

  home.activation.copyAppsForSpotlight = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    hm_apps="${config.home.homeDirectory}/Applications/Home Manager Apps"
    dst="${config.home.homeDirectory}/Applications/Spotlight Apps"
    $DRY_RUN_CMD rm -rf "$dst"
    $DRY_RUN_CMD mkdir -p "$dst"
    for app in "$hm_apps"/*.app; do
      [ -e "$app" ] || continue
      $DRY_RUN_CMD ${pkgs.rsync}/bin/rsync -aL --delete "$app/" "$dst/$(basename "$app")"
    done
  '';
}
