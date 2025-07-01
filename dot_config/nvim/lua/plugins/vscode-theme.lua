return {
  'Mofiqul/vscode.nvim',
  lazy = false,
  priority = 1000,
  opts = {

    transparent = true,
    italic_comments = true,
  },
  init = function()
    vim.cmd.colorscheme('vscode')
  end,
}
