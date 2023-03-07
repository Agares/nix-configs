{ config, pkgs, lib, modulesPath, ... }:
{
  config = {
    virtualisation.docker.enable = true;

    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      pulse = {
        enable = true;
      };
    };
  };
}
