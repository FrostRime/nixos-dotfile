{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };

  home.sessionVariables = {
    VISUAL = "nvim";
    GIT_EDITOR = "nvim";
  };
}
