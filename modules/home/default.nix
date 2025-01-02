{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # Development tools
    zig
    dart
    maven
    terraform

    # System utilities
    neofetch
    fastfetch
    zellij

    # Additional applications
    qbittorrent
    zathura
  ];

  programs = {
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };

    zsh = {
      enable = true;
      enableAutosuggestions = true;
      enableSyntaxHighlighting = true;
      oh-my-zsh = {
        enable = true;
        plugins = [ "git" "docker" "sudo" ];
      };
    };

    alacritty = {
      enable = true;
      settings = {
        font.normal.family = "JetBrainsMono Nerd Font";
        font.size = 11;
      };
    };
  };
}
