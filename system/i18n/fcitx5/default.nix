{ pkgs, ... }:
{
  i18n.inputMethod = {
    type = "fcitx5";
    enable = true;
    enableGtk3 = true;
    fcitx5 = {
      addons = with pkgs; [
        fcitx5-gtk
        qt6Packages.fcitx5-chinese-addons
      ];
      waylandFrontend = true;
    };
  };
}
