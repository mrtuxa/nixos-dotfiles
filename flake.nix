{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, sops-nix }@inputs: {
   nixosConfigurations = { 
      twinkpad = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        system = "x86_64-linux";
        modules = [ 
          ./hosts/laptop/l13/configuration.nix
          home-manager.nixosModules.default
        ];
      };
      
      netcup-server  = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [ 
          ./hosts/server/netcup/configuration.nix
          sops-nix.nixosModules.sops
        ];
      };
    };
  };
}
