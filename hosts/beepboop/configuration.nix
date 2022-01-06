{ pkgs, config , ... }:

{
  imports = [
    ./hardware-configuration.nix

    ./programs/kvm.nix
    ./modules
  ];

  # system

  boot.kernelPackages = pkgs.linuxPackages_latest;

  ## bootloader configuration
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  ## enable sound
  sound.enable = true;

  ## xdg desktop integration
  xdg.portal = {
    enable = true;
    wlr.enable = true;
  };

  # locale

  ## set your time zone
  time.timeZone = "America/Porto_Velho";

  ## select internationalisation properties
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "colemak";
  };

  # wireless

  ## set hostname
  networking.hostName = "beepboop";

  ## enable NetworkManager support
  networking.networkmanager.enable = true;

  ## enable DHCP for the network interfaces
  networking.interfaces = {
    enp2s0.useDHCP = true;
    wlp3s0.useDHCP = true;
  };

  ## enable firewall
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 80 ];
  };

  ## bluetooth support
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings.General.Enable = "Source,Sink,Media,Socket";
  };

  # hardware

  ## disable pulseaudio
  hardware.pulseaudio.enable = false;

  ## opengl
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  # nix

  ## allowed users
  nix.allowedUsers = [ "maturana" ];

  ## add flakes support
  nix.package = pkgs.nixUnstable;
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  ## garbage collector
  nix.gc = {
    automatic = true;
    dates = "weekly";
  };

  ## optimise
  nix.optimise = {
    automatic = true;
    dates = [ "06:00" "13:00" "22:00" ];
  };

  # services

  ## enable pipewire support
  services.pipewire = {
    enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
    pulse.enable = true;
    media-session.enable = true;
    config.pipewire."context.properties" = {
      "link.max-buffers" = 16; # version < 3 clients can't handle more than this
      "log.level" = 2; # https://docs.pipewire.org/page_daemon.html
    };
  };

  ## openssh
  services.openssh.enable = true;

  ## seatd
  mine.services.seatd.enable = true;

  ## udev
  services.udev.packages = [
    pkgs.android-udev-rules
  ];

  # programs

  ## dconf (some programs need that enabled)
  programs.dconf.enable = true;

  ## wireshark
  programs.wireshark = {
    enable = true;
    package = pkgs.wireshark;
  };

  ## light (to use with WMs)
  programs.light.enable = true;

  ## some shells
  programs.fish.enable = true;

  # user
  users.users.maturana = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "video"
      "networkmanager"
      "wireshark"
      "mysql"
      "seatd"
    ];

    # default user shell
    shell = pkgs.fish;
  };

  # security

  ## enable doas (sudo but bloatless)
  security.doas = {
    enable = true;
    extraRules = [{
      groups = [ "wheel" ];
      keepEnv = false;
    }];
  };

  ## enable rtkit (the use of this with wayland is recommended by the wiki)
  security.rtkit.enable = true;

  ## pam
  security.pam.services.swaylock = {};

  # environment

  ## system packages
  environment.systemPackages = with pkgs; [
    qt5.qtwayland
    ntfs3g
  ];

  # fonts

  ## fontconfig
  fonts.fontconfig.defaultFonts = {
    emoji = [ "Noto Color Emoji" ];
    monospace = [ "Noto Sans" "Cascadia Code" ];
    serif = [ "Noto Serif" ];
  };

  ## font packages
  fonts.fonts = with pkgs; [
    # my favorite programming font
    cascadia-code

    # icons font (used by starship)
    (nerdfonts.override {
      fonts = [ "CascadiaCode" ];
    })

    # noto fonts
    noto-fonts
    noto-fonts-extra
    noto-fonts-cjk
    noto-fonts-emoji

    # libreoffice default font
    liberation_ttf
  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "21.05"; # Did you read the comment?
}

