local wezterm = require("wezterm")
local font = require("fonts/iosevka")
local keybindings = require("keybindings")

wezterm.add_to_config_reload_watch_list(wezterm.home_dir .. "/.config/wezterm/fonts")
wezterm.add_to_config_reload_watch_list(wezterm.home_dir .. "/.config/wezterm/keybindings.lua")

local function merge(t1, t2)
    for k, v in pairs(t2) do
        if (type(v) == "table") and (type(t1[k] or false) == "table") then
            merge(t1[k], t2[k])
        else
            t1[k] = v
        end
    end
    return t1
end

wezterm.on("update-right-status", function(window)
    local _, bat_src, _ = wezterm.run_child_process({ wezterm.home_dir .. "/.extras/battery", "source" })

    local bat_percent = ""

    for _, b in ipairs(wezterm.battery_info()) do
        bat_percent = string.format("%.0f%%", b.state_of_charge * 100)
    end

    local date = wezterm.strftime("%d %b / %H:%M")

    local text = string.format("%s (%s) %s ", bat_percent, string.sub(bat_src, 0, -2), date)

    window:set_right_status(text)
end)

wezterm.on("format-tab-title", function(tab, _, _, _, _, max_width)
    local tab_id = wezterm.to_string(tab.tab_id)

    if not wezterm.GLOBAL.enable_tab_path_info[tab_id] then
        return
    end

    local proc_name = string.gsub(tab.active_pane.foreground_process_name, ".*/(%w+)$", "%1")
    local dir_name = ""
    if tab.active_pane.current_working_dir then
        dir_name =
            string.gsub(tab.active_pane.current_working_dir.file_path, ".*/([A-Za-z0-9 _-\\.]+)/(%w+)/$", "%1/%2/")
    end

    if "/" .. dir_name == wezterm.home_dir .. "/" then
        dir_name = "~"
    end

    local title = string.format("%d: %s (%s) ", tab.tab_index + 1, proc_name, dir_name)
    title = wezterm.truncate_right(title, max_width)

    return title
end)

local M = merge({
    front_end = "WebGpu",
    webgpu_power_preference = "HighPerformance",
    -- max_fps = 120,

    audible_bell = "Disabled",

    window_decorations = "RESIZE",
    use_fancy_tab_bar = false,
    enable_tab_bar = true,
    tab_bar_at_bottom = true,
    show_new_tab_button_in_tab_bar = false,
    show_close_tab_button_in_tabs = false,
    tab_max_width = 64,

    window_padding = {
        left = "0.3cell",
        right = "0.3cell",
        top = "0.3cell",
        bottom = 0,
    },

    inactive_pane_hsb = {},

    color_scheme = "kanagawabones",

    colors = {
        split = "#838383",
        tab_bar = {
            background = "#1f1f27",
            inactive_tab = {
                bg_color = "#1f1f27",
                fg_color = "#838383",
            },
            active_tab = {
                bg_color = "#1f1f27",
                fg_color = "#e9838d",
            },
        },
    },

    send_composed_key_when_left_alt_is_pressed = true,
    send_composed_key_when_right_alt_is_pressed = true,
}, keybindings)

return merge(M, font)
