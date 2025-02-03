return {
  'OXY2DEV/markview.nvim',
  lazy = false,
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require('markview').setup {
      injections = {
        languages = {
          markdown = {
            overwrite = true,
            query = [[
              (section
                (atx_heading) @injections.mkv.fold
                (#set! @fold))
              (list_item
                (list_marker) @injections.mkv.list
                (#set! @list))
            ]],
          },
        },
      },
      list_items = {
        enable = true,

        indent_size = 2,
        shift_width = 4,

        --- Define only ONE set of list markers to avoid double icons
        marker_minus = {
          add_padding = false,
          text = '',
          hl = 'MarkviewListItemMinus',
        },
        marker_plus = {
          add_padding = false,
          text = '',
          hl = 'MarkviewListItemPlus',
        },
        marker_star = {
          add_padding = false,
          text = '',
          hl = 'MarkviewListItemStar',
        },

        --- Ensure numbered lists do not get duplicated icons
        marker_dot = { add_padding = false },
        marker_parenthesis = { add_padding = false },
      },
    }
  end,
}
