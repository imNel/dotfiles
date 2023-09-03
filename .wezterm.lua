local wezterm = require 'wezterm'

wezterm.on(
  'format-tab-title',
  function(tab, tabs, panes, config, hover, max_width)
    local edge_background = '#24283B'
    local background = '#24283B'
    local foreground = '#565F89'

    local edge_foreground = background
    if tab.is_active then
      background = '#7AA2F7'
      foreground = '#24283B'
      edge_background = background
      edge_foreground = '#24283B'
    end

    local title = wezterm.truncate_right(tab.active_pane.title, max_width - 2)

    local left_edge = ' '
    local right_edge = ' '

    -- first tab
    if tab.tab_index == 0 then
      if tab.is_active and tab.active_pane.title == 'nvim' then
        left_edge = ' '
      else
        left_edge = ' '
      end
    end

    return {
      { Background = { Color = edge_background } },
      { Foreground = { Color = edge_foreground } },
      { Text = left_edge },
      { Background = { Color = background } },
      { Foreground = { Color = foreground } },
      { Text = title },
      { Background = { Color = edge_background } },
      { Foreground = { Color = edge_foreground } },
      { Text = right_edge },
    }
  end
)

return {
  color_scheme = "Tokyo Night Storm",
  font_size = 16.0,
  tab_bar_at_bottom = true,
  hide_tab_bar_if_only_one_tab = true,
  use_fancy_tab_bar = false,
  window_decorations = "RESIZE",
  show_scroll_bar = false,
  window_padding = {
    left = 8,
    right = 8,
    bottom = 0,
    top = 8,
  },
  tab_max_width = 24,
  colors = {
    tab_bar = {
      active_tab = {
        bg_color = '#ffffff',
        fg_color = '#ffffff',
        intensity = "Bold",
      },
      background = '#24283B',
      new_tab = {
        bg_color = '#24283B',
        fg_color = '#24283B',
      },
    },
  },
}
