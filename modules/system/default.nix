{ config, pkgs, ... }:

{
  imports = [ ];

  # Basic system packages
  environment.systemPackages = with pkgs; [
    # Development
    git
    cmake
    meson
    gcc
    python3
    nodejs
    docker
    docker-compose

    # System utilities
    vim
    neovim
    bat
    eza
    fd
    ripgrep
    htop
    wget
    curl
    jq
    direnv

    # Desktop environment
    alacritty
    rofi
    dunst
    feh
    picom
    polybar
    sxhkd

    # Applications
    firefox
    vlc
    libreoffice-qt
    discord

    # Terminal
    tmux
    zsh
    starship
    ghostty
  ];

  # Enable common services
  services = {
    xserver = {
      enable = true;
      displayManager.lightdm.enable = true;
      windowManager = {
        bspwm.enable = true;
        xmonad.enable = true;
      };
    };

    # Audio
    pipewire = {
      enable = true;
      alsa.enable = true;
      pulse.enable = true;
    };

    # Bluetooth
    bluetooth.enable = true;
  };

  # User configuration
  users.users.peribot = {
    isNormalUser = true;
    extraGroups = [ "wheel" "docker" "networkmanager" ];
    shell = pkgs.zsh;
  };

  # System configuration
  networking.networkmanager.enable = true;
  programs.zsh.enable = true;
  virtualisation.docker.enable = true;

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    (nerdfonts.override { fonts = [ "JetBrainsMono" "SourceCodePro" ]; })
    font-awesome
  ];
}
