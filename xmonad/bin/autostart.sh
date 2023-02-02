#!/usr/bin/env bash

## Autostart Programs


xrandr --output HDMI1 --mode 3840x2160

# Kill already running process
_ps=(picom dunst ksuperkey mpd xfce-polkit xfce4-power-manager)
for _prs in "${_ps[@]}"; do
	if [[ `pidof ${_prs}` ]]; then
		killall -9 ${_prs}
	fi
done

# Fix cursor
xsetroot -cursor_name left_ptr &

# Polkit agent
/usr/lib/xfce-polkit/xfce-polkit &

# Enable power management
xfce4-power-manager &

# Enable Super Keys For Menu
ksuperkey -e 'Super_L=Alt_L|F1' &
ksuperkey -e 'Super_R=Alt_L|F1' &

# Restore wallpaper
#hsetroot -cover /usr/share/backgrounds/nordic-wallpapers-git/sola.png
#hsetroot -cover ~/Downloads/mmmjfak4fkd41.png
#hsetroot -cover ~/Downloads/mono-9.png
#hsetroot -cover ~/.xmonad/wall/gruvbox_a1.png
#hsetroot -cover ~/.xmonad/wall.png
#hsetroot -cover ~/.xmonad/wall.png
hsetroot -cover /home/soham/.xmonad/a.png

# Lauch notification daemon
~/.xmonad/bin/xmodunst.sh

# Lauch polybar
~/.xmonad/bin/launch.sh

# Lauch compositor
~/.xmonad/bin/xmocomp.sh

# Start mpd
exec mpd &
