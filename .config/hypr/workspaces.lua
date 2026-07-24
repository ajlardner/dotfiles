-- 
-- monitors: monitor
-- monitor 1 workspaces
hl.workspace_rule({ workspace = "name:m1", monitor="DP-1"})

-- monitor 2 workspaces
hl.workspace_rule({ workspace = "name:m2", monitor="HDMI-A-1"})

-- monitor 3 workspaces
hl.workspace_rule({ workspace = "name:m3", monitor="DP-2"})

hl.workspace_rule({ workspace = "name:h1", monitor="DP-1" })
hl.workspace_rule({ workspace = "name:h2", monitor="HDMI-A-1" })
hl.workspace_rule({ workspace = "name:h3", monitor="DP-2" })


-- scrolling layout. see https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/               
   hl.config({                                                                                         
       scrolling = {                                                                                   
           -- a single column always spans the full screen                                             
           fullscreen_on_one_column = true,                                                            
                                                                                                       
           -- default column width, [0.1 - 1.0]                                                        
           column_width = 0.9,                                                                       
                                                                                                       
           -- how to bring a focused column into view: 0 = center, 1 = fit                             
           focus_fit_method = 1,                                                                       
                                                                                                       
           -- min fraction of a window that must be visible for focus to follow, [0.0 - 1.0]           
           follow_min_visible = 1.0,                                                                   
                                                                                                       
           -- preset widths cycled by colresize +conf/-conf                                            
           explicit_column_widths = "0.334, 0.5, 0.667, 0.9, 1.0",                                          
       },                                                                                              
   })
