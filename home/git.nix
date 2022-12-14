{ user, ... }: {
  programs.git = {
    enable = true;
    userEmail = user.email;
    userName = user.name;
    extraConfig = {
      init.defaultBranch = "main";
      credential = { helper = "store"; };
      push = { default = "current"; };
      pull = {
        rebase = false;
        default = "current";
      };
    };
  };
}
