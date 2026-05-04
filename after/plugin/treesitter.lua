local treesitter = require 'nvim-treesitter'

treesitter.setup {
  ensure_installed = {
    'bash',
    'c',
    'diff',
    'html',
    'lua',
    'markdown',
    'markdown_inline',
    'vim',
    'vimdoc',
  },

  auto_install = true,
  highlight = {
    enabled = true,
  },
  indent = {
    enabled = true,
  },
}
