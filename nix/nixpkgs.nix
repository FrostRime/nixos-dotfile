{ inputs, ... }:
{
  nixpkgs.config = {
    allowUnfree = true;
    allowUnsupportedSystem = true;
    android_sdk.accept_license = true;
  };
  nixpkgs.overlays = [
    inputs.nix-cachyos-kernel.overlays.pinned
    inputs.helium-flake.overlays.default
  ];
  nixpkgs.hostPlatform = {
    system = "x86_64-linux";
  };
}
