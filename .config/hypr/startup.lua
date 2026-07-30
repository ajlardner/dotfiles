hl.on("hyprland.start", function () 
	hl.exec_cmd("kitty", { monitor = "HDMI-A-1" }) 
	hl.exec_cmd("obsidian", { monitor = "DP-1" })
	hl.exec_cmd("brave-origin", { monitor = "DP-2" })
	hl.exec_cmd("wl-paste --watch cliphist store")
	hl.exec_cmd("nm-applet")
end)

hl.on("hyprland.start", function()
	hl.exec_cmd("systemctl --user start hyprland-session.target")
end)

hl.on("hyprland.shutdown", function()
	os.execute("systemctl --user stop hyprland-session.target && sleep 0.1")
end)

