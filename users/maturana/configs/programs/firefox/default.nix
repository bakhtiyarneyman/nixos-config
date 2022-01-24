{ pkgs
, ...
}:

{
  programs.firefox = {
    enable = true;
    profiles = {
      default = {
        name = "default";
        extraConfig = builtins.readFile ./user.js;
      };
    };
    extensions = with pkgs.nur.repos.rycee.firefox-addons; [
      ublock-origin
      privacy-badger
      cookie-autodelete
      decentraleyes
    ];
  };
}
