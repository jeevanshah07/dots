{
  description = "NixOS config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dotfiles = {
      url = "git+https://github.com/jeevanshah07/dots-hyprland?submodules=1";
      flake = false;
    };

    illogical-flake = {
      url = "github:soymou/illogical-flake";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.dotfiles.follows = "dotfiles";
    };
  };

  outputs = { nixpkgs, home-manager, illogical-flake, ... }: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
        home-manager.nixosModules.home-manager
        {
	  home-manager.backupFileExtension = "bak";
	  
          home-manager.users.marvel = {
            imports = [ illogical-flake.homeManagerModules.default ];
            programs.home-manager.enable = true;

	    programs.illogical-impulse = {
	      enable = true;

	      dotfiles = {
	        fish.enable = true;
		kitty.enable = true;
		starship.enable = true;
             };
	   };

            programs.neovim = {
              enable = true;
              defaultEditor = true;
              viAlias = true;
              vimAlias = true;
            };

            xdg.configFile = {
	      "nvim" = {
                 source = ./dots/.config/nvim;
		 force = true;
	      };
              "hypr" = {
	         source = ./dots/.config/hypr;
		 force = true;
	       };
            };

	    programs.fish = {
	      enable = true;

	      interactiveShellInit = ''
	      	fish_vi_key_bindings
		set fish_sequence_key_delay_ms 150
		set -g fish_bind_mode default

		bind -M insert jk 'commandline -f vi-normal-mode'
	      '';
	    };
            home.stateVersion = "26.05";
          };
        }
      ];
    };
  };
}
