{ user, ... }: {
  programs.git = {
    enable = true;
    userEmail = user.email;
    userName = user.name;
    extraConfig = {
      credential = { helper = "store"; };
    };
  };
}
