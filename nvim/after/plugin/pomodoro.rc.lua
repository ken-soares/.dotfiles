require('lualine').setup({
  sections = {
    lualine_c = { 'filename', require('pomodoro').statusline }
  }
})
