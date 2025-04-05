import XMonad
import XMonad.Util.Paste
import XMonad.Hooks.DynamicLog

myTerminal = "wezterm"
myModMask = mod4Mask
myBorderWidth = 2
myNormalBorderColor = "#dddddd"
myFocusedBorderColor = "#dddddd"
-- myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $
-- [
--     -- X-selection-paste buffer
-- ((0, xK_Insert), pasteSelection)
-- ]

myConfig = defaultConfig {
    terminal = myTerminal
        , modMask = myModMask -- change mod to win key
        , borderWidth = myBorderWidth
        , normalBorderColor     = myNormalBorderColor 
        , focusedBorderColor    = myFocusedBorderColor
        -- , keys = myKeys
}

main :: IO()
main = do
    xmobar myConfig >>= xmonad

--{ https://note.kurodigi.com/xmonad-basic/ }--

