{
  systemd.user.services.sleep_time = {
    Unit = {
      Description = "I need to sleep";
    };
    Service = {
      Type = "oneshot";
      ExecStart = "systemctl hibernate";
    };
  };

  systemd.user.timers.sleep_time = {
    Unit = {
      Description = "Sleep Timer";
      RefuseManualStart = "no";
    };
    Timer = {
      Unit = "sleep_time.service";
      OnCalendar = "*-*-* 23:00:00";
    };
    Install = {
      WantedBy = [ "timers.target" ];
    };
  };
}
