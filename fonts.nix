{ pkgs, ... }:

{
        fonts = {
                fontconfig.enable = true;
                fontconfig.ultimate.enable = true;
                fontconfig.ultimate.substitutions = "combi";
                fontconfig.hinting.autohint = false;
                fontconfig.subpixel.lcdfilter = "default";
                enableFontDir = true;
                fonts = with pkgs ; [
                        terminus_font
                        gohufont
                        ubuntu_font_family
                        fira
                        fira-code
                        fira-mono
                ];
        };
}
