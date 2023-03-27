local wezterm = require "wezterm"
-- local gpus = wezterm.gui.enumerate_gpus()

return {
    -- webgpu_preferred_adapter = gpus[0],
    -- front_end = "WebGpu",
    -- webgpu_power_preference = 'HighPerformance',
    -- max_fps = 120,

    audible_bell = "Disabled",

    window_padding = {
        left = "0.3cell",
        right = "0.3cell",
        top = "0.3cell",
        bottom = 0,
    },

    enable_tab_bar = false,
    window_decorations = "RESIZE",

    scrollback_lines = 10,

    -- font_size = 16.5,
    -- font = wezterm.font("Operator Mono", { weight=325 }),

    font_size = 16.0,
    font = wezterm.font("League Mono", { weight="Regular"}),
    font_rules = {
        {
            italic = true,
            intensity = "Normal",
            font = wezterm.font {
                family = "League Mono",
                style = "Normal",
                weight = "Regular"
            },
        },
        -- {
        --     italic = true,
        --     intensity = "Normal",
        --     font = wezterm.font {
        --         family = "Operator Mono",
        --         style = "Italic",
        --         weight = 325
        --     },
        -- },
    },
    -- harfbuzz_features = { "salt", "ss01" },

    -- font_size = 15.0,
    -- font = wezterm.font("IBM Plex Mono", { weight="Regular" }),
    -- harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' },

    color_scheme = "rose-pine",

    send_composed_key_when_left_alt_is_pressed = true,
    send_composed_key_when_right_alt_is_pressed = true,
}
