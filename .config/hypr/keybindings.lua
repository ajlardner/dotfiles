local mainMod = "SUPER" -- Sets "Windows" key as main modifier

-- window actions
hl.bind(mainMod .. " + Q", 	hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + W", 	hl.dsp.window.close())
hl.bind(mainMod .. " + E", 	hl.dsp.window.fullscreen({ action = "toggle" }))
hl.bind(mainMod .. " + C", hl.dsp.layout("colresize -conf"))
-- select any open window using rofi
hl.bind(mainMod .. " + SPACE",	hl.dsp.exec_cmd("$(rofi -show window)"))
-- launch specific programs
-- launch any apps with a deskto<D-n>p entry using rofi
hl.bind(mainMod .. " + A", 	hl.dsp.exec_cmd("$(rofi -show drun)"))
hl.bind(mainMod .. " + S", 	hl.dsp.exec_cmd("wezterm"))
hl.bind(mainMod .. " + D", 	hl.dsp.exec_cmd("pcmanfm")) 
hl.bind(mainMod .. " + F", 	hl.dsp.exec_cmd("librewolf"))
hl.bind(mainMod .. " + period", hl.dsp.exec_cmd("rofi-rbw"))

-- exit hyprland
hl.bind(mainMod .. " + equal", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))

-- move window focus 
hl.bind(mainMod .. " + H",  	hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + J",	hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + K", 	hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + L", 	hl.dsp.focus({ direction = "right" }))

hl.bind(mainMod .. " + left",  	hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", 	hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    	hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  	hl.dsp.focus({ direction = "down" }))

hl.bind(mainMod .. " + Y", 	hl.dsp.focus({ monitor = "l" }))
hl.bind(mainMod .. " + U",  	hl.dsp.focus({ workspace = "m-1" }))
hl.bind(mainMod .. " + I", 	hl.dsp.focus({ workspace = "m+1" }))
hl.bind(mainMod .. " + O", 	hl.dsp.focus({ monitor = "r" }))

-- move / resize windows
hl.bind(mainMod .. " + SHIFT + H",  hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + J",  hl.dsp.window.move({ direction = "down" }))
hl.bind(mainMod .. " + SHIFT + K",    hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.move({ direction = "right" }))

hl.bind(mainMod .. " + SHIFT + left",  hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + up",    hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + down",  hl.dsp.window.move({ direction = "down" }))

hl.bind(mainMod .. " + SHIFT + Y",   hl.dsp.window.move({ monitor = "l" }))
hl.bind(mainMod .. " + SHIFT + U",   hl.dsp.window.move({ workspace = "m-1" }))
hl.bind(mainMod .. " + SHIFT + I",   hl.dsp.window.move({ workspace = "m+1" }))
hl.bind(mainMod .. " + SHIFT + O",   hl.dsp.window.move({ monitor = "r" }))
hl.bind(mainMod .. " + P",	     hl.dsp.window.move({ workspace = "r+1" }))  

-- select an entry from clipboard history using rofi -dmenu and cliphist
hl.bind(mainMod .. " + SHIFT + V", hl.dsp.exec_cmd("cliphist list | rofi -dmenu | cliphist decode | wl-copy"))

-- Move/resize windows with maiddod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })
--
-- Requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })
