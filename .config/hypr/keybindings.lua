local mainMod = "SUPER" -- Sets "Windows" key as main modifier

-- window actions
hl.bind(mainMod .. " + W", 		hl.dsp.window.close())
hl.bind(mainMod .. " + O", 		hl.dsp.window.float({ action = "toggle" }))
-- launch specific programs
hl.bind(mainMod .. " + SPACE", 		hl.dsp.exec_cmd("$(rofi -show drun)"))
hl.bind(mainMod .. " + B", 		hl.dsp.exec_cmd("brave-origin "))
hl.bind(mainMod .. " + N", 		hl.dsp.exec_cmd("kitty"))
hl.bind(mainMod .. " + M", 		hl.dsp.exec_cmd("dolphin")) 
-- lock screen / power management
hl.bind(mainMod .. " + Insert", 	hl.dsp.exec_cmd("hyprlock"))
hl.bind(mainMod .. " + Delete", 	hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))

-- if a monitor is not identified here, it should be considered to be using hyprland defaults
-- or we should actually get info about it
local monitor_map = {
	[1] = "DP-1",
	[2] = "HDMI-A-1",
	[3] = "DP-2"
}

-- show first workspace on all monitors TODO: make this loop through all monitors programatically, not just 1-5
hl.bind(mainMod .. "+ grave", function()
	for i=1, 5 do
		hl.dispatch(hl.dsp.focus({ monitor = monitor_map[i] or i }))
		hl.dispatch(hl.dsp.focus({ workspace = "m~1"  }))
	end
end)

-- move window focus 
hl.bind(mainMod .. " + H",  	hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + L", 	hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + K", 	hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + J",	hl.dsp.focus({ direction = "down" }))

hl.bind(mainMod .. " + left",  	hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", 	hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    	hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  	hl.dsp.focus({ direction = "down" }))

hl.bind(mainMod .. " + A", 	hl.dsp.focus({ monitor = "l" }))
hl.bind(mainMod .. " + S", 	hl.dsp.focus({ monitor = "r" }))
hl.bind(mainMod .. " + D",  	hl.dsp.focus({ workspace = "m-1" }))
hl.bind(mainMod .. " + F", 	hl.dsp.focus({ workspace = "m+1" }))

-- move / resize windows
hl.bind(mainMod .. " + SHIFT + H",  hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + K",    hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + J",  hl.dsp.window.move({ direction = "down" }))

hl.bind(mainMod .. " + SHIFT + left",  hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + up",    hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + down",  hl.dsp.window.move({ direction = "down" }))

hl.bind(mainMod .. " + SHIFT + A",   hl.dsp.window.move({ monitor = "l" }))
hl.bind(mainMod .. " + SHIFT + S",   hl.dsp.window.move({ monitor = "r" }))
hl.bind(mainMod .. " + SHIFT + D",   hl.dsp.window.move({ workspace = "m-1" }))
hl.bind(mainMod .. " + SHIFT + F",   hl.dsp.window.move({ workspace = "m+1" }))
hl.bind(mainMod .. " + Q",	     hl.dsp.window.move({ workspace = "r+1" }))  


-- TODO: make the setting a config and notifying into a function
-- takes a string for config key in format `section.config`, i.e. "scrolling.column_width" and a value, sets it using hl.config, and outputs a notification
function set_config(key, value)
end


hl.bind(mainMod .. " + C", hl.dsp.layout("colresize -conf"))
hl.bind(mainMod .. " + V", hl.dsp.layout("colresize +conf"))
hl.bind(mainMod .. " + Z", function () 
	col_width = math.max(hl.get_config("scrolling.column_width") / 2, 0.25)
	if col_width < 0.25 then return end
	hl.config({ scrolling = { column_width = col_width }})
	hl.notification.create({ text = "scrolling.column_width set to: " .. col_width, timeout = 5000})
end)
hl.bind(mainMod .. " + X", function () 
	col_width = math.min(hl.get_config("scrolling.column_width") * 2, 1)
	if col_width > 1 then return end
	hl.config({ scrolling = { column_width = col_width }})
	hl.notification.create({ text = "scrolling.column_width set to: " .. col_width, timeout = 5000})
end)

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
