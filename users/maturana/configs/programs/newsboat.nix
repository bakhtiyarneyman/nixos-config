{
  programs.newsboat = {
    enable = true;
    urls = [
      # reddit
      {
        url = "https://www.reddit.com/r/linux.rss";
        tags = [ "reddit" "social" "linux" ];
        title = "r/linux";
      }
      {
        url = "https://reddit.com/r/unixporn.rss";
        tags = [ "reddit" "social" "linux" ];
        title = "r/unixporn";
      }

      # news
      {
        url = "http://feeds.bbci.co.uk/news/world/rss.xml";
        tags = [ "bbc" "news" ];
        title = "BBC News - World";
      }
      {
        url = "http://rss.cnn.com/rss/edition_world.rss";
        tags = [ "cnn" "news" ];
        title = "CNN - World";
      }

      # youtube
      {
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCngn7SVujlvskHRvRKc1cTw";
        tags = [ "videos" "youtube" "linux" ];
        title = "BugsWriter";
      }
    ];
    extraConfig = ''
      macro v set browser "mpv"; open-in-browser; set browser firefox
    '';
  };
}
