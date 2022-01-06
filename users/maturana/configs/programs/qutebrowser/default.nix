{ pkgs
, ...
}:

let
  homepage = ./homepage;

  adblockScripts = [
    "https://easylist.to/easylist/easylist.txt"
    "https://easylist.to/easylist/easyprivacy.txt"
    "https://easylist-downloads.adblockplus.org/easylistdutch.txt"
    "https://easylist-downloads.adblockplus.org/abp-filters-anti-cv.txt"
    "https://www.i-dont-care-about-cookies.eu/abp/"
    "https://secure.fanboy.co.nz/fanboy-cookiemonster.txt"
  ];
in
{
  programs.qutebrowser = {
    enable = true;
    keyBindings = {
      normal = {
        ",v" = "spawn mpv {url}";
        ",dv" = "spawn youtube-dl {url}";
        ",dm" = "spawn youtube-dl -x --audio-format mp3 {url}";
      };
    };
    settings = {
      url.default_page = "${homepage}/index.html";
      url.start_pages = "${homepage}/index.html";

      fonts.default_family = "Cascadia Code";

      content.javascript.enabled = true;
      content.cookies.accept = "no-3rdparty";
      content.blocking.method = "adblock";
      content.blocking.adblock.lists = adblockScripts;


      completion = {
        open_categories = [ "searchengines" "quickmarks" "bookmarks" "filesystem" ];
      };
    };
    quickmarks = {
      "invidious" = "https://yewtu.be/";
      "mastadon" = "https://mstdn.social/";
      "lemmy" = "https://lemmy.ml/";
      "codeberg" = "https://codeberg.org/";
    };
    extraConfig = ''
      with config.pattern('https://(www\.)?youtube.com/') as p:
          p.content.cookies.accept = 'never'

      with config.pattern('https://*.google.com/') as p:
          p.content.cookies.accept = 'never'
    '';
  };
}
