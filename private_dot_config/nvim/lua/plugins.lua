local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  "christoomey/vim-tmux-navigator",
  { "junegunn/fzf", dir = "~/.fzf", build = "./install --all" },
  "junegunn/fzf.vim",
  "vim-airline/vim-airline-themes",
  "vim-airline/vim-airline",
  "preservim/nerdtree",
  "Yggdroot/indentLine",
  "folke/trouble.nvim",
  "nvim-treesitter/nvim-treesitter",
  "chengzeyi/multiterm.vim",
  -- LSP
  "onsails/lspkind.nvim",
  { 'neovim/nvim-lspconfig' },
  { 'hrsh7th/nvim-cmp', config = [[require('config.nvim-cmp')]] },
  { 'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp' },
  { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
  { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
  { 'hrsh7th/cmp-cmdline', after = 'nvim-cmp' },
  'L3MON4D3/LuaSnip',
  'saadparwaiz1/cmp_luasnip',
  "Mofiqul/vscode.nvim",
})

