local kb = require('utils.kb')

vim.opt.signcolumn = 'yes'

local keyset = vim.keymap.set
-- Autocomplete
function _G.check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end
-- Use Tab for trigger completion with characters ahead and navigate
-- NOTE: There's always a completion item selected by default, you may want to enable
-- no select by setting `"suggest.noselect": true` in your configuration file
-- NOTE: Use command ':verbose imap <tab>' to make sure Tab is not mapped by
-- other plugins before putting this into your config
local opts2 = { silent = true, noremap = true, expr = true, replace_keycodes = false }
keyset('i', '<c-j>', 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts2)
keyset('i', '<c-k>', [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts2)

vim.g.coc_global_extensions = {'coc-snippets', 'coc-json', 'coc-pyright'}

-- Use K to show documentation in preview window
function _G.show_docs()
    local cw = vim.fn.expand('<cword>')
    if vim.fn.index({ 'vim', 'help' }, vim.bo.filetype) >= 0 then
      vim.api.nvim_command('h ' .. cw)
    elseif vim.api.nvim_eval('coc#rpc#ready()') then
      vim.fn.CocActionAsync('doHover')
    else
      vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
    end
end

keyset('n', 'K', '<CMD>lua _G.show_docs()<CR>', { silent = true })


-- Use `[c` and `]c` to navigate diagnostics
vim.keymap.set('n', '[c', '<Plug>(coc-diagnostic-prev)', opts)
vim.keymap.set('n', ']c', '<Plug>(coc-diagnostic-next)', opts)

-- Remap keys for gotos
vim.api.nvim_set_keymap('n', 'gd', [[<Plug>(coc-definition)]], kb.silent_noremap)
vim.api.nvim_set_keymap('n', 'gy', [[<Plug>(coc-type-definition)]], kb.silent_noremap)
vim.api.nvim_set_keymap('n', 'gi', [[<Plug>(coc-implementation)]], kb.silent_noremap)
vim.api.nvim_set_keymap('n', 'gr', [[<Plug>(coc-references)]], kb.silent_noremap)

-- show commit contains current position
vim.keymap.set('n', 'gC', '<Plug>(coc-git-commit)', opts)

-- Make <CR> to accept selected completion item or notify coc.nvim to format
-- <C-g>u breaks current undo, please make your own choice
keyset('i', '<tab>', [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts2)
