{ config, pkgs, ... }:
{
  services = {
    fwupd.enable = true;
    thermald.enable = true;
    fstrim.enable = true;
    tlp.enable = false;
    power-profiles-daemon.enable = false;
    xserver.videoDrivers = [ "amdgpu" ];
  };
  boot = {
    kernelModules = [
      "hp-wmi"
    ];
    kernelParams = [ "amd_pstate=active" ];
    initrd.kernelModules = [ "amdgpu" ];
  };
  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
    };
    cpu.amd.updateMicrocode = true;
    enableRedistributableFirmware = true;
  };
}
