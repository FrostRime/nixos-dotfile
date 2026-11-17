{ pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./hp-config
  ];

  environment.systemPackages = with pkgs; [
    exfatprogs
    usbutils
  ];

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    audio.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;

    wireplumber = {
      extraConfig = {
        "10-bluez" = {
          "monitor.bluez.properties" = {
            "bluez5.enable-sbc-xq" = true;
            "bluez5.enable-msbc" = true;
            "bluez5.enable-hw-volume" = true;
            "bluez5.roles" = [
              "a2dp_sink"
              "a2dp_source"
              "hfp_hf"
              "hfp_ag"
              "hsp_hs"
              "hsp_ag"
            ];
          };
        };
        "11-bluetooth-policy" = {
          "wireplumber.settings" = {
            "bluetooth.autoswitch-to-headset-profile" = false;
          };
        };
      };
    };
  };

  services.logind = {
    settings = {
      Login = {
        HandlePowerKey = "suspend";
        HandlePowerKeyLongPress = "reboot";
      };
    };
  };

  hardware = {
    acpilight.enable = true;
    enableRedistributableFirmware = true;
    bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings = {
        General = {
          Experimental = true;
          Enable = "Source,Sink,Media,Socket";
        };
      };
    };
  };
}
