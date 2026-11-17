{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # terminal
    bat
    btop
    cfonts
    cpufetch
    dust
    fastfetch
    fd
    ffmpeg_8
    fzf
    lolcat
    p7zip
    ripgrep
    television
    wiremix
    bluetui
    frp

    # development
    android-tools
    cargo
    cargo-generate
    cargo-ndk
    clang
    flutter
    jdk25
    nix-tree
    nixd
    nixfmt
    onefetch
    tokei

    # desktop and GUI
    apostrophe
    fractal
    grim
    helium
    loupe
    mission-center
    nautilus
    openssl
    qq
    slurp
    telegram-desktop
    wl-clipboard

    # network / system TUI
    impala
  ];
}
