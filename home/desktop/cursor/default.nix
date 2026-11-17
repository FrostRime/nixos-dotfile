{
  config,
  pkgs,
  ...
}:
{
  home.pointerCursor = {
    enable = true;
    gtk.enable = config.gtk.enable;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
  };
}
