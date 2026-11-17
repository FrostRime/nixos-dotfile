{
  ...
}:
{
  programs.nh = {
    enable = true;
    clean = {
      enable = true;
      dates = "3 days";
    };
  };
  environment.variables.NH_FLAKE = "/etc/nixos/";
}
