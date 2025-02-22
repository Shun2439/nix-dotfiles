export GTK_IM_MODULE=fcitx5
export QT_IM_MODULE=fcitx5
export XMODIFIERS=@im=fcitx5
export DefaultIMModule=fcitx5
xrdb ~/.Xresources
fcitx5 &
exec xmonad

