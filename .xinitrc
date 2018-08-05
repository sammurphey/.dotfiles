#!/bin/sh
xhost +localhsot &
userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then







    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then






    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

#twm &
#xclock -geometry 50x50-1+1 &
#xterm -geometry 80x50+494+51 &
#xterm -geometry 80x20+494-0 &


# UPDATE SETTINGS

xrdb -merge ~/.Xdefaults &


# SET BACKGROUND

~/.fehbg &

while true
do
    ~./fehbg &
    sleep 3600s
done &



# SHADOWS

compton -c --config ~/compton.conf &

# STATUS BARS

# rust-dwm-status &
~/bin/dwm_status &
conky -x 0 -y 0 &


# PRINTS TIME IN STATUS BAR

#while true 
#do
#    xsetroot -name  "Volume: $(amixer get Master | tail -n1 | sed -r 's/.*\[(.*)%\].*/\1/')% $REPLY "
#    sleep 1s
#done &



# START SOME NICE PROGRAMS

google-chrome-stable &

urxvt -title terminal -e alsamixer &
# urxvt -title terminal -e ~/Startup/.react &
urxvt -title terminal -e ~/Startup/.gulp &
urxvt -title terminal &

atom &

pcmanfm &
# urxvt -title files -e nnn -c 6 &

filezilla &



# LAUNCH WINDOW MANAGER

exec ~/dwm/dwm

export $DISPLAY=:0.0
