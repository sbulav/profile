local cmd = vim.api.nvim_command
local o = vim.o
local vimcmd = vim.cmd

local apply_options = function(opts)
  for k, v in pairs(opts) do
    if v == true then
      cmd('set ' .. k)
    elseif v == false then
      cmd(string.format('set no%s', k))
    else
      cmd(string.format('set %s=%s', k, v))
    end
  end
end

-- Set theme
vim.g.colors_name = "solarized8_high"

-- Add current path and subpaths to path
o.path = o.path .. '**'

-- Highlight on yank
vimcmd("autocmd TextYankPost * lua vim.highlight.on_yank{higroup='IncSearch', timeout=1500, on_visual=true}")

local options = {
  -- Visual customizations{{{
  termguicolors = true,   -- truecolours for better experience
  wrap = false,           -- Don't wrap lines
  showmatch = true,       -- Show Matching parenthesis
  ignorecase = true,      -- case insensitive on search
  smartcase = true,       -- improve searching using '/'
  hlsearch = false,       -- Highlight search matches as you type
  incsearch = true,       -- Show search matches as you type
  inccommand = "nosplit", -- Show result of substitution immediately

  number = true,          -- Always show line number
  relativenumber = true,  -- Always show relative numbers
  cursorline = true,      -- Change current line background
  scrolloff = 8,          -- Keep 8 lines above and under current line
  laststatus = 2,         -- Always enable statusline
  showtabline = 1,        -- Show tabline when more than 1 tab}}}

  -- Files & Buffers{{{
  hidden = true,              -- Do not close the buffers, hide them
  history = 1000,             -- Remember more commands and search history
  undolevels = 1000,          -- Remember more levels of undo
  -- noerrorbells = true,        -- No buzz on error
  -- novisualbell = true,        -- No 'visual buzz' on error
  -- t_vb = "",                  -- Same as above
  -- autoread = true,            -- Reload the file if changed from the outside
  switchbuf = "vsplit",       -- If opening a file from :ls, :buffers, :files, etc. jump to open version
                              -- of the file, if one exists
  clipboard = "unnamed",      -- Use * and + registers to access system clipboard(i.e. tmux)
  confirm = true,             -- Dialog foor unsaved changes
  splitright = true,          -- Go to right pane by default (Needed for quickmenu)
  shortmess = "csa",          -- Disable some hit-enter messages}}}

  -- Terminal setup{{{
  lazyredraw = true,          -- lazyredraw to make macro faster
  showcmd = true,             -- Show keys in status}}}

  -- Indentation{{{
  expandtab = true,           -- Use spaces instead of tabs
  tabstop = 2,                -- Number of visual spaces per tab
  shiftwidth = 2,             -- Number of spaces for autoindent
  autoindent = true,          -- Enable autoindent
  smartindent = true,         -- Enable smart indentation
  -- copyindent = true,          -- Enable autoindent
  shiftround = true,          -- Use n shiftwidth when indenting with <,>
  smarttab = true,            -- Use smart removal when using tabs
  nojoinspaces = true,        -- one space after joining lines with puncutation}}}

  -- Folding{{{
  foldmethod = "marker",      -- foldmethod using marker
  foldlevel = 10,             -- limit foldings}}}

  -- Trailings / tabs{{{
  list = true,                -- display listchars
  fillchars = "vert:│,eob:\\ ", -- make vertical split sign better
  listchars = "eol:↲,tab:»\\ ", -- set listchars
  -- listchars="tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+" -- my old listchars}}}

  -- Better vimdiff{{{
  diffopt = "internal,algorithm:patience,indent-heuristic",--}}}
  --
  -- Completion{{{
  pumheight = 10,              -- limit completion items
  timeoutlen = 400, -- faster timeout wait time
  updatetime = 100, -- set faster update time ]]}}}

}

apply_options(options)