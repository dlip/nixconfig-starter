{ user, ... }: {
  programs.git = {
    enable = true;
    userEmail = user.email;
    userName = user.name;
  };
}
