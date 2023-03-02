local wezterm = require "wezterm"


return {
    front_end = "WebGpu",

    window_padding = {
        left = "0.3cell",
        right = "0.3cell",
        top = "0.3cell",
        bottom = 0,
    },

    enable_tab_bar = false,
    window_decorations = "RESIZE",

    font_size = 15.5,
    font = wezterm.font("Operator Mono", { weight=325 }),
    -- font_size = 15.0,
    -- font = wezterm.font("IBM Plex Mono", { weight="Regular" }),
    -- harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' },

    color_scheme = "rose-pine",
}
