return {
  'OXY2DEV/markview.nvim',
  lazy = false,
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require('markview').setup {
      markdown = {
        list_items = {
          enable = true,

          indent_size = 2,
          shift_width = 2,

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
        tables = {
          enable = true,

          parts = {
            top = { '╭', '─', '╮', '┬' },
            header = { '│', '│', '│' },
            separator = { '├', '─', '┤', '┼' },
            row = { '│', '│', '│' },
            bottom = { '╰', '─', '╯', '┴' },

            overlap = { '┝', '━', '┥', '┿' },

            align_left = '╼',
            align_right = '╾',
            align_center = { '╴', '╶' },
          },

          hl = {
            top = { 'TableHeader', 'TableHeader', 'TableHeader', 'TableHeader' },
            header = { 'TableHeader', 'TableHeader', 'TableHeader' },
            separator = { 'TableHeader', 'TableHeader', 'TableHeader', 'TableHeader' },
            row = { 'TableBorder', 'TableBorder', 'TableBorder' },
            bottom = { 'TableBorder', 'TableBorder', 'TableBorder', 'TableBorder' },

            overlap = { 'TableBorder', 'TableBorder', 'TableBorder', 'TableBorder' },

            align_left = 'TableAlignLeft',
            align_right = 'TableAlignRight',
            align_center = { 'TableAlignCenter', 'TableAlignCenter' },
          },

          col_min_width = 10,
          block_decorator = true,
          use_virt_lines = false,
        },
      },
    }
  end,
}
