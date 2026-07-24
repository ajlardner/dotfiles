local function switchAllMonitorsToHomeLayout()
  local monitors = hl.get_monitors()
  if not monitors then return end

  for i, mon in ipairs(monitors) do
    local targetWSName = "home" .. i
    
    hl.dispatch(hl.dsp.workspace.move({ workspace = "name:" .. targetWSName, monitor = mon.id }))
    
    
    -- 5. Focus the workspace on this monitor (now populated)
    hl.dispatch(hl.dsp.workspace.move({ workspace = "name:" .. targetWSName, monitor = mon.id }))
    
    -- 6. Run custom commands (workspace is guaranteed to exist now)
    -- === CUSTOM COMMANDS SECTION ===
    -- Example: hl.exec_cmd("echo 'Setup for " .. targetWSName .. "' >> /tmp/hypr_setup.log")
    -- hl.exec_cmd("~/.config/hypr/scripts/setup_workspace.sh " .. targetWSName)
    -- ===============================
    
  end
end

-- Bind to key
hl.bind("SUPER + SHIFT + P", switchAllMonitorsToHomeLayout)   
