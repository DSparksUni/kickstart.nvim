local toggleterm = require 'toggleterm'

toggleterm.setup {
  shell = 'powershell',
  direction = 'float',
  shade_terminals = true,
  start_in_insert = true,
  persist_mode = true,
}

vim.keymap.set({ 'n', 't' }, '<leader>`', function()
  toggleterm.toggle()
end, {
  desc = 'Toggle terminal',
})

local Terminal = require('toggleterm.terminal').Terminal

local gradle_run = Terminal:new {
  cmd = 'powershell -NoExit -Command ./gradlew run',
  direction = 'float',
  close_on_exit = false,
}
vim.keymap.set('n', '<leader>rr', function()
  gradle_run:toggle()
end, {
  desc = 'Gradle run',
})
