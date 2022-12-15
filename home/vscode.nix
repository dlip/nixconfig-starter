{ pkgs, ... }: {
  programs.vscode = {
    enable = true;
    # There are certain vscode extensions that have native binaries that need to be added here, you can install other plugins normally via vscode ui
    extensions = with pkgs.vscode-extensions; [
      ms-vsliveshare.vsliveshare
    ];
  };
}
