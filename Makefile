.PHONY: update
update:
	home-manager switch --flake .#profile --extra-experimental-features 'nix-command flakes'