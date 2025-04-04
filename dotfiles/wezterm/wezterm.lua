
-- Pull in the wezterm API
local wezterm = require 'wezterm'

--local background = require 'background'

-- This will hold the configuration.
local config = wezterm.config_builder()
config.automatically_reload_config = true
config.font_size = 11.0
config.use_ime = true

config.window_background_opacity = 0.90

config.hide_tab_bar_if_only_one_tab = true
config.show_new_tab_button_in_tab_bar = false

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
   local background = "#5c6d74"
   local foreground = "#FFFFFF"

   if tab.is_active then
     background = "#ae8b2d"
     foreground = "#FFFFFF"
   end

   local title = "   " .. wezterm.truncate_right(tab.active_pane.title, max_width - 1) .. "   "

   return {
     { Background = { Color = background } },
     { Foreground = { Color = foreground } },
     { Text = title },
   }
end)


--[[
--]]
config.background = {
  {
    source = {
      Gradient = {
        colors = { "#001522", "#000000" }, -- グラデーションのカラーセット
        orientation = {
          Linear = { angle = -30.0 }, -- グラデーションの方向と角度
        },
      },
    },
    opacity = 0.9,
    width = "100%",
    height = "100%",
  },
  {
    source = {
      --File = "/home/ywada/Pictures/konamon.jpg",
      --File = "/home/ywada/Pictures/konamon_nintubo-removebg.png",
      File = "/home/ywada/Pictures/konamon_nintubo2-removebg.png",
      --File = "/home/ywada/Pictures/konamon_nintubo3-removebg.png",
      --File = "/home/ywada/Pictures/konamon_nintubo4-removebg.png",
    },
    opacity = 0.40,
    repeat_x = "NoRepeat",
    repeat_y = "NoRepeat",
    vertical_align = "Bottom",
    horizontal_align = "Right",
    height = 300,
    width =  250,
  },
}

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'iceberg-dark'

-- and finally, return the configuration to wezterm
return config
