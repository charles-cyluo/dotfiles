#!/usr/bin/fish
# Reference: https://bbs.archlinux.org/viewtopic.php?id=214298

printf "script started" | systemd-cat -t low-battery-notification #write to log when script is called

set bat_info (acpi -b)
if echo $bat_info | grep -q "Discharging"
  set before_percent (string split "%" $bat_info)[1]
  set percentage (string split " " $before_percent)[-1]
  if test $percentage -lt 20
    printf "condition is true" | systemd-cat -t low-battery-notification #write to log if condition is true
    /usr/bin/notify-send -u critical "Battery Low" "$bat_info"
  end
end
