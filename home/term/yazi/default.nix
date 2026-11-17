{ pkgs, ... }:
{
  programs.yazi = {
    enable = true;
    plugins = {
      inherit (pkgs.yaziPlugins) git;
      inherit (pkgs.yaziPlugins) sudo;
      inherit (pkgs.yaziPlugins) diff;
      inherit (pkgs.yaziPlugins) chmod;
      inherit (pkgs.yaziPlugins) starship;
      inherit (pkgs.yaziPlugins) wl-clipboard;
    };
  };
}
