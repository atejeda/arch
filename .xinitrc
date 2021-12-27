#!/bin/sh

# startx with the desired dpi (notebooks)
# startx -- -dpi 96

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

# general

# reload xresources
xrdb -merge ~/.Xresources

# tildes
setxkbmap -layout us -variant intl

# disable bell
xset -b b off

# system defined functions

function desktop() {
    display_monitor="DVI-D-0";
    display_mode="1920x1080";
}

function notebook() {
    display_monitor="eDP-1";
    display_mode="1920x1080";
    setxkbmap -option "ctrl:nocaps"
}

# configure and start xmonad

if [[ -f $HOME/.notebook.lock ]]; then 
    notebook; 
else 
    desktop;
fi

xrandr --output $display_monitor --mode $display_mode
nitrogen --restore &
xscreensaver --no-splash &

exec xmonad
