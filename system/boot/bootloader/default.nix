{
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
    };
    limine = {
      enable = true;
      maxGenerations = 30;
      efiSupport = true;
    };
  };
}
