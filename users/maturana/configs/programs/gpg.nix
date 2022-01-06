{
  programs.gpg = {
    enable = true;
    settings = {
      fixed-list-mode = true;
      keyid-format = "long";
      use-agent = true;
      no-emit-version = true;
    };
  };
}
