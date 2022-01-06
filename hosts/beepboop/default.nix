{ nixpkgs, home-manager, inputs, ... }:

nixpkgs.lib.nixosSystem rec {
  system = "x86_64-linux";

  modules = [
    home-manager.nixosModules.home-manager

    ({ pkgs, ... }: {
      nix = {
        binaryCachePublicKeys = [
          "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
          #"nixpkgs-wayland.cachix.org-1:3lwxaILxMRkVhehr5StQprHdEo4IrE8sRho9R9HOLYA="
        ];
        binaryCaches = [
          "https://cache.nixos.org"
          #"https://nixpkgs-wayland.cachix.org"
        ];
      };

      nixpkgs = {
        config.allowUnfree = true;
        overlays = with inputs; [
          nix.overlay
          nur.overlay
          #nixpkgs-wayland.overlay
          neovim.overlay
        ];
      };
    })

    {
      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;

        sharedModules = with inputs; [
          nix-colors.homeManagerModule
          nixvim.homeManagerModules.nixvim
        ];

        users.maturana = import ../../users/maturana;

        extraSpecialArgs = { inherit (inputs) nix-colors; };
      };

      nixpkgs = {
        config.allowUnfree = true;
        inherit system;
      };
    }

    ./configuration.nix
  ];
}
