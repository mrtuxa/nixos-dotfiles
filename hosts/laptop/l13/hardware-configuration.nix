# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "usb_storage" "sd_mod" "rtsx_pci_sdmmc" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];
  boot.extraModprobeConfig = "options kvm_amd nested=1";

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/7fb2f4f1-3fea-44b5-b6cc-64c602a64ca0";
      fsType = "ext4";
    };

  boot.initrd.luks.devices."luks-1282ea7b-2ce1-4a61-9dd2-d20b4ce1467f".device = "/dev/disk/by-uuid/1282ea7b-2ce1-4a61-9dd2-d20b4ce1467f";

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/C2E2-4B80";
      fsType = "vfat";
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/19a5806a-a713-4194-b445-f211a596b880"; }
    ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp3s0f0.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp6s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
