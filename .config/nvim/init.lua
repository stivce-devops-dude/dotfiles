-- Enable true color support
vim.opt.termguicolors = true

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

-- Tabs & indentation
vim.opt.expandtab = true        -- Use spaces instead of tabs
vim.opt.shiftwidth = 4          -- Shift 4 spaces when tab
vim.opt.tabstop = 4             -- 1 tab == 4 spaces
vim.opt.smartindent = true      -- Smart autoindent on new lines

-- Syntax highlighting
vim.cmd("syntax enable")
vim.cmd("filetype plugin indent on")

-- Optional: default colorscheme to ensure consistency
vim.cmd("colorscheme default")

-- Transparent background
local function set_transparent_background()
  local groups = {
    "Normal", "NormalNC", "VertSplit", "StatusLine", "StatusLineNC",
    "SignColumn", "EndOfBuffer", "LineNr", "CursorLineNr", "Folded",
    "TabLine", "TabLineFill", "TabLineSel", "MsgArea", "Pmenu"
  }
  for _, group in ipairs(groups) do
    vim.api.nvim_set_hl(0, group, { bg = "none", ctermbg = "none" })
  end
end

-- Set on startup
vim.schedule(set_transparent_background)

-- Re-apply after any colorscheme is loaded
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    vim.schedule(set_transparent_background)
  end,
})
