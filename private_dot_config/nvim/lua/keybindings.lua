--Plugin setup
--Nerdtree
vim.cmd.nnoremap({"<Leader>t", ":NERDTreeFind<CR>"})

--FZF
vim.cmd.nmap({"<Leader>F", ":Files<CR>"})
vim.cmd.nmap({"<Leader>f", ":GFiles<CR>"})
vim.cmd.nmap({"<Leader>h", ":History<CR>"})
vim.cmd.nmap({"<Leader>g", ":Rg<Space>"})
vim.cmd.nmap({"<Leader>b", ":Buffers<CR>"})
vim.cmd.let({"g:rg_derive_root='true'"})

--Tmux navigation
vim.cmd.nmap({"<C-h>", "<Cmd>TmuxNavigateLeft<CR>"})
vim.cmd.nmap({"<C-j>", "<Cmd>TmuxNavigateDown<CR>"})

-- Search
vim.cmd.nnoremap({"<CR>", ":noh<CR><CR>"})

-- Folding
vim.opt.foldenable = true
vim.opt.foldlevelstart = 2
vim.opt.foldnestmax = 20
vim.opt.foldmethod = "indent"
vim.cmd.vnoremap({"<", "<gv"})
vim.cmd.vnoremap({">", ">gv"})

-- Key mappings
vim.cmd.nnoremap({"<C-J>", "<C-W><C-J>"})
vim.cmd.nnoremap({"<C-K>", "<C-W><C-K>"})
vim.cmd.nnoremap({"<C-L>", "<C-W><C-L>"})
vim.cmd.nnoremap({"<C-H>", "<C-W><C-H>"})

vim.cmd.nnoremap({"tc",  ":tabclose<CR>"})
vim.cmd.nnoremap({"tn", ":tabnew %<CR>"})

local map = vim.keymap.set

-- vim-tmux-navigator
if os.getenv("TMUX") then
  map("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>")
  map("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>")
  map("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>")
  map("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>")
end

-- Paste from buffer without removing current buffer when highlighting
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Leader + y will yank to system clipboard.
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])
