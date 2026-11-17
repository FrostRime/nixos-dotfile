{ pkgs, ... }:
{
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      libinput
      freetype
      libgit2
      libgit2-glib
    ];
  };
}
