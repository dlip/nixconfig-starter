{ ... }: {
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      ms-vsliveshare-vsliveshare
    ];
  };
}
