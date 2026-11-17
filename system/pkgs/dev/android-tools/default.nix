{ ... }:
{
  users.groups.adbusers = { };
  users.groups.plugdev = { };

  services.udev.extraRules = ''
    SUBSYSTEM=="usb", ENV{ID_USB_INTERFACES}=="*:ff4201:*", MODE="0660", GROUP="plugdev", TAG+="uaccess"
  '';
}
