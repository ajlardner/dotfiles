local c = {
  bg0 = "#222426", -- editor background
  bg1 = "#272a30",
  bg2 = "#2e323c",
  fg1 = "#e3e3e1", -- main foreground
  fg4 = "#8f908a", -- dimmed foreground
  red = "#f92672",
  green = "#a6e22e",
  yellow = "#e6db74",
  blue = "#66d9ef",
  purple = "#ae81ff",
  orange = "#fd971f",
}

return {
  normal = {
    a = { fg = c.bg0, bg = c.blue, gui = "bold" },
    b = { fg = c.fg1, bg = c.bg2 },
    c = { fg = c.fg1, bg = c.bg1 },
  },
  insert = {
    a = { fg = c.bg0, bg = c.green, gui = "bold" },
  },
  visual = {
    a = { fg = c.bg0, bg = c.yellow, gui = "bold" },
  },
  replace = {
    a = { fg = c.bg0, bg = c.red, gui = "bold" },
  },
  command = {
    a = { fg = c.bg0, bg = c.purple, gui = "bold" },
  },
  terminal = {
    a = { fg = c.bg0, bg = c.orange, gui = "bold" },
  },
  inactive = {
    a = { fg = c.fg4, bg = c.bg1 },
    b = { fg = c.fg4, bg = c.bg1 },
    c = { fg = c.fg4, bg = c.bg1 },
  },
}

