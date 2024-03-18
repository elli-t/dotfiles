--file formatting
vim.cmd.autocmd({"BufNewFile,BufRead", "*.html", "setlocal", "sw=2", "sts=2", "ts=2"})
vim.cmd.autocmd({"BufNewFile,BufRead", "*.css", "setlocal", "sw=2", "sts=2", "ts=2"})
vim.cmd.autocmd({"BufNewFile,BufRead", "*.js", "setlocal", "sw=2", "sts=2", "ts=2"})
vim.cmd.autocmd({"BufNewFile,BufRead", "*.ts", "setlocal", "sw=2", "sts=2", "ts=2"})
vim.cmd.autocmd({"BufNewFile,BufRead", "*.tsx", "setlocal", "sw=2", "sts=2", "ts=2"})
vim.cmd.autocmd({"BufNewFile,BufRead", "*.py", "setlocal", "sw=4", "sts=4", "ts=4", "tw=100"})
vim.cmd.autocmd({"BufNewFile,BufRead", "*.sh", "autoindent", "setlocal", "sw=2", "sts=2", "ts=2"})
vim.cmd.autocmd({"BufNewFile,BufRead", "*.zshrc", "autoindent", "setlocal", "sw=2", "sts=2", "ts=2"})
vim.cmd.autocmd({"BufNewFile,BufRead", "*.cc", "autoindent", "setlocal", "sw=2", "sts=2", "ts=2"})
vim.cmd.autocmd({"BufNewFile,BufRead", "*.proto", "autoindent", "setlocal", "sw=2", "sts=2", "ts=2"})
vim.cmd.autocmd({"BufNewFile,BufRead", "*.vim", "autoindent", "setlocal", "sw=2", "sts=2", "ts=2"})
vim.cmd.autocmd({"BufNewFile,BufRead", "*.h", "autoindent", "setlocal", "sw=2", "sts=2", "ts=2"})
vim.cmd.autocmd({"BufNewFile,BufRead", "*.pbtxt", "autoindent", "setlocal", "sw=2", "sts=2", "ts=2"})
vim.cmd.autocmd({"BufNewFile,BufRead", "*.json", "autoindent", "setlocal", "sw=2", "sts=2", "ts=2"})
vim.cmd.autocmd({"BufNewFile,BufRead", "*.yaml", "autoindent", "setlocal", "sw=2", "sts=2", "ts=2"})
vim.cmd.autocmd({"BufNewFile,BufRead", "*.sql", "autoindent", "setlocal", "sw=2", "sts=2", "ts=2"})
vim.cmd.autocmd({"BufNewFile,BufRead", "*.lua", "setlocal", "sw=2", "sts=2", "ts=2"})

--Colours
vim.cmd.colorscheme({"slate"})

-- General Stuff
vim.opt.expandtab = true
vim.opt.hidden = true
vim.opt.lazyredraw = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.showcmd = true
vim.opt.showmatch = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.tw = 80
vim.opt.ttyfast = true
vim.opt.wildmenu = true
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.list = false

-- Highlight
vim.opt.showmode = false
vim.cmd.highlight({"ExtraWhitespace", "ctermbg=red", "guibg=red"})
vim.opt.cursorline = true
vim.cmd.highlight({"CursorLine", "ctermbg=darkgrey",  "term=none", "cterm=none"})
vim.cmd.highlight({"LineNr", "ctermfg=yellow", "ctermbg=black"})

--Spellcheck
vim.o.spell = true
vim.o.spelllang= "en"
vim.o.spellfile = "$HOME/vim/spell/en.utf-8.add"

vim.diagnostic.config({virtual_text = false})

-- Show line diagnostics automatically in hover window
vim.o.updatetime = 250
-- vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
-- Function to check if a floating dialog exists and if not
  -- then check for diagnostics under the cursor
  function OpenDiagnosticIfNoFloat()
    for _, winid in pairs(vim.api.nvim_tabpage_list_wins(0)) do
      if vim.api.nvim_win_get_config(winid).zindex then
        return
      end
    end
    -- THIS IS FOR BUILTIN LSP
    vim.diagnostic.open_float(0, {
      scope = "cursor",
      focusable = false,
      close_events = {
        "CursorMoved",
        "CursorMovedI",
        "BufHidden",
        "InsertCharPre",
        "WinLeave",
      },
    })
  end
  -- Show diagnostics under the cursor when holding position
  vim.api.nvim_create_augroup("lsp_diagnostics_hold", { clear = true })
  vim.api.nvim_create_autocmd({ "CursorHold" }, {
    pattern = "*",
    command = "lua OpenDiagnosticIfNoFloat()",
    group = "lsp_diagnostics_hold",
  })
