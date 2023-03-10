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

    programs.dconf.enable = true;

    fonts = {
      enableDefaultFonts = true;
      fonts = with pkgs; [
        iosevka
        noto-fonts
        noto-fonts-emoji
        lato
      ];

      fontconfig = {
        defaultFonts = {
          serif = [ "Noto Serif" "Noto Color Emoji" ];
          sansSerif = [ "Lato" "Noto Sans" "Noto Color Emoji" ];
          monospace = [ "Iosevka" "Noto Color Emoji" ];
        };
      };
    };
  };
}
