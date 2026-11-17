{ pkgs, ... }: {
  home.packages = with pkgs; [
    tray-tui
  ];
}
