require("lualine").setup{
  options = {
    theme = 'ayu',
    component_separators = {left= '', right= ''},
    section_separators = {left= '', right= ''},
  },
  sections = {
    lualine_a = {
      {'filename',
        file_status = true,
        path = 1,
      }
    }
  }
}
