import XMonad
import XMonad.Hooks.DynamicLog (xmobar)
import XMonad.Hooks.ManageDocks (avoidStruts, docksEventHook, manageDocks)
import XMonad.Util.EZConfig (additionalKeysP)

myTerminal = "xfce4-terminal"
myModMask = mod4Mask
myBorderWidth = 2
myNormalBorderColor = "#313244"
myFocusedBorderColor = "#89b4fa"

myConfig =
    defaultConfig
        { terminal = myTerminal
        , modMask = myModMask -- change mod to win key
        , borderWidth = myBorderWidth
        , normalBorderColor = myNormalBorderColor
        , focusedBorderColor = myFocusedBorderColor
        -- xmobar / stalonetray の領域を避ける
        , manageHook = manageDocks <+> manageHook defaultConfig
        , layoutHook = avoidStruts (layoutHook defaultConfig)
        , handleEventHook = docksEventHook <+> handleEventHook defaultConfig
        }
        `additionalKeysP`
            [ -- defaultConfig の Mod-p は dmenu を呼ぶが、nixpkgs の dmenu は壊れている
              ("M-p", spawn "rofi -show drun")
            , ("M-S-p", spawn "rofi -show run")
            , ("<Print>", spawn "maim -s | xclip -selection clipboard -t image/png")
            , ("<XF86AudioRaiseVolume>", spawn "pamixer -i 5")
            , ("<XF86AudioLowerVolume>", spawn "pamixer -d 5")
            , ("<XF86AudioMute>", spawn "pamixer -t")
            , ("<XF86AudioPlay>", spawn "playerctl play-pause")
            , ("<XF86AudioNext>", spawn "playerctl next")
            , ("<XF86AudioPrev>", spawn "playerctl previous")
            , ("<XF86MonBrightnessUp>", spawn "brightnessctl set +10%")
            , ("<XF86MonBrightnessDown>", spawn "brightnessctl set 10%-")
            ]

main :: IO ()
main = xmobar myConfig >>= xmonad

--{ https://note.kurodigi.com/xmonad-basic/ }--
