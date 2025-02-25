import XMonad
import XMonad.Hooks.DynamicLog

main :: IO()
main = do
				xmobar myConfig >>= xmonad

myConfig = defaultConfig
				{
					terminal = myTerminal
				, modMask = mod4Mask -- change mod to win key
				, borderWidth = 2
				, normalBorderColor     = "#cccccc" 
				, focusedBorderColor    = "#cd8b00"
				}

myTerminal = "wezterm"

--{ https://note.kurodigi.com/xmonad-basic/ }--

