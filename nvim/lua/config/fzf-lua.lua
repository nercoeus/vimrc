local actions = require('fzf-lua.actions')
local kb = require('utils.kb')

vim.g.fzf_layout = { ['window']= { ['width']= 0.9, ['height']= 0.6 } }


vim.g.diagnostic_icons = {
    Error = '',
    Warning = '',
    Information = '',
    Hint = 'ﴞ',
    Other = '',
}


require('fzf-lua').setup({
  winopts = {
    hls = {
      border = 'FloatBorder',
    },
    -- split         = "belowright new",-- open in a split instead?
                                        -- "belowright new"  : split below
                                        -- "aboveleft new"   : split above
                                        -- "belowright vnew" : split right
                                        -- "aboveleft vnew   : split left
    height     = 0.9,     -- window height
    width      = 0.85,     -- window width
    row        = 0.35,     -- window row position (0=top, 1=bottom)
    col        = 0.50,     -- window col position (0=left, 1=right)
    border     = 'double', -- 'none', 'single', 'double', 'thicc' or 'rounded'
    fullscreen = false,    -- start fullscreen?
    preview = {
      -- default     = 'bat',           -- override the default previewer?
                                        -- default uses the 'builtin' previewer
      border         = 'border',        -- border|noborder, applies only to
                                        -- native fzf previewers (bat/cat/git/etc)
      wrap           = 'nowrap',        -- wrap|nowrap
      hidden         = 'nohidden',      -- hidden|nohidden
      vertical       = 'down:45%',      -- up|down:size
      horizontal     = 'right:60%',     -- right|left:size
      layout         = 'flex',          -- horizontal|vertical|flex
      flip_columns   = 120,             -- #cols to switch to horizontal on flex
      -- Only used with the builtin previewer:
      title          = true,            -- preview border title (file/buf)?
      title_pos      = "center",        -- left|center|right, title alignment
      scrollbar      = 'float',         -- `false` or string:'float|border'
                                        -- float:  in-window floating border
                                        -- border: in-border chars (see below)
      scrolloff      = '-2',            -- float scrollbar offset from right
                                        -- applies only when scrollbar = 'float'
      scrollchars    = {'█', '' },      -- scrollbar chars ({ <full>, <empty> }
                                        -- applies only when scrollbar = 'border'
      -- delay          = 100,             -- delay(ms) displaying the preview
                                        -- prevents lag on fast scrolling
      winopts = {                       -- builtin previewer window options
        number            = true,
        relativenumber    = false,
        cursorline        = true,
        cursorlineopt     = 'both',
        cursorcolumn      = false,
        signcolumn        = 'no',
        list              = true,
        foldenable        = true,
        foldmethod        = 'manual',
      },
    },
    on_create = function()
      -- called once upon creation of the fzf main window
      -- can be used to add custom fzf-lua mappings, e.g:
      -- vim.keymap.set("t", "<C-j>", "<Down>", { silent = true, buffer = true })
    end,
  },
  preview_layout = 'flex',  -- horizontal|vertical|flex
  flip_columns = 150,
  fzf_opts = {
    ['--border'] = 'none',
  },
  previewers = {
    builtin = {
      scrollbar = false,
    },
  },
  grep = {
    actions = {
      ['default'] = actions.file_edit_or_qf,
      ['ctrl-q'] = actions.file_sel_to_qf,
    },
  },
  buffers = {
    git_icons = false,
    actions = {
      ['ctrl-w'] = actions.buf_del,
      ['ctrl-q'] = actions.file_sel_to_qf,
    },
  },
  files = {
    fd_opts = [[--color never --type f --hidden --follow --strip-cwd-prefix]],
    git_icons = false,
    actions = {
      ['default'] = actions.file_edit,
      ['ctrl-q'] = actions.file_sel_to_qf,
    },
  },
  quickfix = {
    git_icons = false,
    actions = {
      ['default'] = actions.file_edit_or_qf,
      ['ctrl-q'] = actions.file_sel_to_qf,
    },
  },
  lsp = {
    async_or_timeout = false,
    severity = 'Warning',
    icons = {
      ['Error'] = { icon = vim.g.diagnostic_icons.Error, color = 'red' },
      ['Warning'] = { icon = vim.g.diagnostic_icons.Warning, color = 'yellow' },
      ['Information'] = { icon = vim.g.diagnostic_icons.Information, color = 'blue' },
      ['Hint'] = { icon = vim.g.diagnostic_icons.Hint, color = 'blue' },
    },
    actions = {
      ['default'] = actions.file_edit_or_qf,
      ['ctrl-q'] = actions.file_sel_to_qf,
    },
  },
})

vim.api.nvim_set_keymap('n', '<C-p>', [[<CMD>lua require('fzf-lua').files()<CR>]], kb.silent_noremap)
vim.api.nvim_set_keymap('n', '<C-m>', [[<CMD>lua require('fzf-lua').buffers()<CR>]], kb.silent_noremap)
vim.api.nvim_set_keymap('n', '<C-g>', [[<CMD>lua require('fzf-lua').live_grep()<CR>]], kb.silent_noremap)
vim.api.nvim_set_keymap('n', '<space>fs', [[<CMD>lua require('fzf-lua').live_grep_resume()<CR>]], kb.silent_noremap)
vim.api.nvim_set_keymap('n', '<leader>fp', [[<CMD>lua require('fzf-lua').files_resume()<CR>]], kb.silent_noremap)
vim.api.nvim_set_keymap('n', '<leader>ff', [[<CMD>lua require('fzf-lua').git_status()<CR>]], kb.silent_noremap)
-- 搜索当前光标单词
vim.api.nvim_set_keymap('n', '<leader>fw', [[<CMD>lua require('fzf-lua').grep_cword()<CR>]], kb.silent_noremap)
vim.api.nvim_set_keymap('n', '<leader>fg', [[<CMD>lua require('fzf-lua').git_files()<CR>]], kb.silent_noremap)
vim.api.nvim_set_keymap('n', '<leader>fm', [[<CMD>lua require('fzf-lua').marks()<CR>]], kb.silent_noremap)
vim.api.nvim_set_keymap('n', '<leader>fy', [[<CMD>lua require('fzf-lua').registers()<CR>]], kb.silent_noremap)
vim.api.nvim_set_keymap('n', '<leader>fh', [[<CMD>lua require('fzf-lua').help_tags()<CR>]], kb.silent_noremap)
vim.api.nvim_set_keymap('n', '<leader>fq', [[<CMD>lua require('fzf-lua').quickfix()<CR>]], kb.silent_noremap)
vim.api.nvim_set_keymap('n', '<leader>fa', [[<CMD>lua require('fzf-lua').lsp_code_actions()<CR>]], kb.silent_noremap)
-- <silent>

vim.api.nvim_set_keymap(
  'n',
  '<leader>fb',
  [[<CMD>lua require('fzf-lua').lsp_document_diagnostics()<CR>]],
  kb.silent_noremap
)
vim.api.nvim_set_keymap(
  'n',
  '<leader>fn',
  [[<CMD>lua require('fzf-lua').lsp_workspace_diagnostics()<CR>]],
  kb.silent_noremap
)

-- vim.cmd [[
-- highlight FzfLuaNormal guibg=#383850
-- highlight FzfLuaBorder guibg=#383850
-- ]]

-- vim.opt.winblend = 5
-- vim.opt.termguicolors = true
  
-- vim.g.mapleader = " "