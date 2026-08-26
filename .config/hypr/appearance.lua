hl.config({
    general = {
        gaps_in  = 2,
        gaps_out = 2,

        border_size = 1,

        col = {
            active_border   = { colors = { "rgba(A9DC76ee)" } },
    	},
    },

    decoration = {
        rounding = 0,

        active_opacity   = 0.99,
        inactive_opacity = 0.875,

        blur = {
            enabled  = false,
            size     = 4,
            passes   = 8,
            vibrancy = 0.2,
        },
    },

    animations = {
        enabled = true
    },
})
