local wezterm = require 'wezterm';

local config = {
  check_for_updates = false,

  text_background_opacity = 1.0,
  window_background_opacity = 1.0,

  -- font
  font = wezterm.font("JetBrains Mono", {weight="Bold", italic=false}),
  font_size = 10.0,

  -- color schemes
  color_scheme = "Humanoid dark (base16)",
}

return config
