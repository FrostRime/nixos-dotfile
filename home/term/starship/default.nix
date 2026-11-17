{ lib, ... }: {
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      format = lib.concatStrings [
        "╭"
        "─"
        "$all"
        "╰"
        "─"
        "$character"
      ];
      character = {
        success_symbol = " ";
        error_symbol = " ";
      };
    };
  };
}
