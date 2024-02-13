return{
  "akinsho/toggleterm.nvim",

  config = function ()
    require("toggleterm").setup{}

  vim.keymap.set('n', '<leader>x', ':ToggleTerm<CR>')
  vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]])
  end,
}
