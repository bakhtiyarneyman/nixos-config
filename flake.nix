{
  description = "My NixOS configuration";

  inputs = {
    # flakes
    nix.url = "github:nixos/nix";
    home-manager.url = "github:nix-community/home-manager";
    nixpkgs-wayland.url = "github:nix-community/nixpkgs-wayland";
    nur.url = "github:nix-community/NUR";
    nix-colors.url = "github:Misterio77/nix-colors";
    nixvim.url = "github:imMaturana/nixvim";
    neovim.url = "github:nix-community/neovim-nightly-overlay";

    # branches
    unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    nixpkgs.follows = "unstable";
  };

  outputs = { self, nixpkgs, home-manager, ... } @ inputs:
  {
    nixosConfigurations.beepboop = import ./hosts/beepboop {
      inherit nixpkgs home-manager inputs;
    };

    beepboop = self.nixosConfigurations.beepboop.config.system.build.toplevel;
  };
}
