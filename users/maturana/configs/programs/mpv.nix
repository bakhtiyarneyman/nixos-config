{
  programs.mpv = {
    enable = true;
    config = {
      volume = "60";
    };
    bindings = {
      h = "seek -5";
      l = "seek 5";
      "Shift+h" = "seek -60";
      "Shift+l" = "seek 60";
    };
  };
}
