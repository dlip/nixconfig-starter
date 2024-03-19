{config, ...}: {
  programs.git = {
    enable = true;
    userEmail = config.home.email;
    userName = config.home.name;
    extraConfig = {
      init.defaultBranch = "main";
      credential = {helper = "store";};
      push = {default = "current";};
      pull = {
        rebase = false;
        default = "current";
      };
    };
  };
}
