{lib, ...}:
with lib; {
  options.home = {
    name = mkOption {
      type = types.str;
      default = "Example User";
    };
    email = mkOption {
      type = types.str;
      default = "user@example.com";
    };
  };
  imports = [
    ./packages.nix
    ./direnv.nix
    ./git.nix
    ./bash.nix
    ./zsh.nix
    ./nvim.nix
    ./starship.nix
  ];
}
