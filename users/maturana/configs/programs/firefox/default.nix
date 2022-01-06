{ pkgs
, ...
}:

{
  programs.firefox = {
    enable = true;
    #package = pkgs.wrapFirefox pkgs.firefox-esr-unwrapped {
    #  forceWayland = true;
    #  extraPolicies = {
    #    ExtensionSettings = {};
    #    SearchEngines = {
    #      Default = "DuckDuckGo";

    #      Remove = [
    #        "Amazon.com"
    #        "Bing"
    #        "Wikipedia (en)"
    #      ];
    #    };
    #  };
    #};
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
