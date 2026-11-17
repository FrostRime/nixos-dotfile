{ pkgs, ... }: {
  fonts = {
    packages = with pkgs; [
      maple-mono.truetype
      maple-mono.NF-unhinted
      maple-mono.NF-CN-unhinted
      noto-fonts-color-emoji
    ];
    fontDir.enable = true;
    fontconfig = {
      defaultFonts = {
        emoji = [
          "Noto Color Emoji"
        ];
        monospace = [
          "Maple Mono NF CN"
        ];
        sansSerif = [
          "Maple Mono NF CN"
        ];
        serif = [
          "Maple Mono NF CN"
        ];
      };
    };
  };
}
