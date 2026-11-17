{ lib, ... }:
{
  imports = [
    ./hard
    ./net
    ./env
    ./pkgs
    ./boot
    ./sched
    ./themes
    ./i18n
    ./displaymanager
    ./xdg
    ./security
  ];
  options = {
    replaceStdenv = lib.mkOption {
      type = lib.types.anything;
      default = pkgs: pkgs.stdenv;
      description = "Function to replace stdenv (chaotic‑cx/nyx compatibility)";
    };
  };

  config = {
    zramSwap = {
      enable = true;
      algorithm = "lz4";
    };
    services.zram-generator.enable = true;
    system.stateVersion = "25.11";
  };
}
