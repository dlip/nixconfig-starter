{ ... }: {
  programs.git = {
    enable = true;

    userEmail = "user@example.com";
    userName = "Example User";
  };
}
