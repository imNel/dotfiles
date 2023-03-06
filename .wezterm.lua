local wezterm = require 'wezterm'

wezterm.on(
  'format-tab-title',
  function(tab, tabs, panes, config, hover, max_width)
    local edge_background = '#191726'
    local background = '#191726'
    local foreground = '#e0def4'

    local edge_foreground = background
    if tab.is_active then
      background = '#569fba'
      foreground = '#191726'
      edge_background = background
      edge_foreground = '#191726'
    end

    local title = wezterm.truncate_right(tab.active_pane.title, max_width - 2)

    local left_edge = ' '
    local right_edge = ' '

    if tab.active_pane.title == 'nvim' then
      title = ''
    end
    if tab.active_pane.title == 'yarn' then
      title = ''
    end
    if tab.active_pane.title == 'lg' then
      title = ''
    end

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
  color_scheme = "duskfox",
  font_size = 14.0,
  tab_bar_at_bottom = true,
  hide_tab_bar_if_only_one_tab = true,
  use_fancy_tab_bar = false,
  window_decorations = "RESIZE",
  show_scroll_bar = false,
  window_padding = {
    left = 0,
    right = 0,
    bottom = 0,
    top = 20,
  },
  tab_max_width = 24,
  colors = {
    tab_bar = {
      active_tab = {
        bg_color = '#ffffff',
        fg_color = '#ffffff',
        intensity = "Bold",
      },
      background = '#191726',
      new_tab = {
        bg_color = '#191726',
        fg_color = '#191726',
      },
    },
  },
}
