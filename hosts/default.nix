{
  inputs,
  nixpkgs,
  self,
  ...
}:
let
  sharedOSModules = with inputs; [
    ../system
    ../nix
    stylix.nixosModules.stylix
    catppuccin.nixosModules.catppuccin
    deepseek-harness.nixosModules.default
    daeuniverse.nixosModules.honk
    home-manager.nixosModules.home-manager
    (
      {
        config,
        user,
        host,
        lib,
        pkgs,
        ...
      }:
      {
        users.users.${user} = {
          isNormalUser = true;
          shell = pkgs.fish;
          description = "A normal human";
          extraGroups = [
            "wheel"
            "docker"
            "libvirtd"
            "audio"
            "bluetooth"
            "pipewire"
            "video"
            "kvm"
            "seat"
            "plugdev"
            "adbusers"
          ];
        };
        networking.hostName = host;

        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          extraSpecialArgs = {
            inherit
              inputs
              self
              host
              user
              ;
          };
          users.${user} = {
            imports = sharedHomeModules;
          };
        };
      }
    )
  ];

  sharedHomeModules = with inputs; [
    ../home
    stylix.homeModules.stylix
    catppuccin.homeModules.catppuccin

    { stylix.overlays.enable = false; }

    (
      { user, ... }:
      {
        home.stateVersion = "25.05";
        home.username = "${user}";
        home.homeDirectory = "/home/${user}";
      }
    )
  ];

  mkHost =
    {
      host,
      user,
      extraSysModules ? [ ],
      ...
    }:
    {
      nixosConfigurations.${host} = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit
            inputs
            nixpkgs
            self
            host
            user
            ;
        };
        modules = extraSysModules ++ sharedOSModules;
      };
    };
in
{
  flake = import ./hosts.nix |> map mkHost |> builtins.foldl' (x: y: x // y) { };
}
