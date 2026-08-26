hl.on("hyprland.start", function () 
	-- main / center monitor, HDMI-A-1 on normal desktop setup
	hl.exec_cmd("wezterm", { monitor = "HDMI-A-1" }) 

	-- left monitor, DP-1 on normal desktop setup
	hl.exec_cmd("wezterm", { monitor = "DP-1" })
	hl.exec_cmd("vesktop", { monitor = "DP-1", workspace = 5 })

	-- right monitor, DP-2 on normal desktop setup
	hl.exec_cmd("librewolf", { monitor = "DP-2" })

	-- top right / extra monitor, DP-3 on normal desktop setup
	hl.exec_cmd("wezterm start spotify_player", { monitor = "DP-3" })
	hl.exec_cmd("wezterm start aerc", { monitor = "DP-3"})

	-- background processes
	hl.exec_cmd("wl-paste --watch cliphist store")
	hl.exec_cmd("nm-applet")
	hl.exec_cmd("systemctl --user start hyprland-session.target")

end)

hl.on("hyprland.shutdown", function()
    os.execute("systemctl --user stop hyprland-session.target && sleep 0.1")
end)
