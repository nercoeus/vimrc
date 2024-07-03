-- 配置按键映射

-- define common options
local opts = {
    noremap = true,      -- non-recursive
    silent = true,       -- do not show message
}

-----------------
-- Normal mode --
-----------------

-- 使用 f4 格式化文件
vim.keymap.set('n', '<F4>', ':Autoformat<CR>', opts)

vim.keymap.set('n', 'qq', ':q<CR>', opt)
vim.keymap.set('n', '<C-w>', ':w<CR>', opt)

vim.keymap.set('n', '<Leader><Space>', ':!<Space>', opts)

-- Use jk to replace ESC
vim.keymap.set('i', 'jk', '<ESC>', opts)

-- Hint: see `:h vim.map.set()`
-- Better window navigation
vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)

-- 分屏 sv(split vertically) sh(split horizontally)
vim.keymap.set('n', 'sv', ':vs<CR>', opt)
vim.keymap.set('n', 'sh', ':sp<CR>', opt)
-- 关闭当前窗口 (close)
vim.keymap.set('n', 'sc', '<C-w>c', opt)
-- 关闭其他窗口 (close other)
vim.keymap.set('n', 'so', '<C-w>o', opt)

-- Resize with arrows
-- delta: 2 lines
vim.keymap.set('n', '<C-Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<C-Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', opts)

-----------------
-- Visual mode --
-----------------

-- Hint: start visual mode with the same area as the previous area and the same mode
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)


vim.keymap.set('n', '<Leader>s', ':<C-u>call gitblame#echo()<CR>', opts)


-----------------
-- easymotion ---
-----------------

-- 使用 ss 启用
vim.keymap.set('n', '<space><space>', '<Plug>(easymotion-s2)', opts)
-- 忽略大小写
vim.g.EasyMotion_smartcase = 1

----------------------
-- indent blankline --
----------------------

vim.g.indent_blankline_char = '|'


----------------------
------- airline ------
----------------------

vim.keymap.set('n', '[b', ':bp<CR>', opts)
vim.keymap.set('n', ']b', ':bn<CR>', opts)

vim.keymap.set('n', '<leader>1', '<Plug>AirlineSelectTab1', opts)
vim.keymap.set('n', '<leader>2', '<Plug>AirlineSelectTab2', opts)
vim.keymap.set('n', '<leader>3', '<Plug>AirlineSelectTab3', opts)
vim.keymap.set('n', '<leader>4', '<Plug>AirlineSelectTab4', opts)
vim.keymap.set('n', '<leader>5', '<Plug>AirlineSelectTab5', opts)
vim.keymap.set('n', '<leader>6', '<Plug>AirlineSelectTab6', opts)
vim.keymap.set('n', '<leader>7', '<Plug>AirlineSelectTab7', opts)
vim.keymap.set('n', '<leader>8', '<Plug>AirlineSelectTab8', opts)
vim.keymap.set('n', '<leader>9', '<Plug>AirlineSelectTab9', opts)
vim.keymap.set('n', '<leader>c', ':bp | bd #<CR>', opts)


----------------------
------- coc.nvim -----
----------------------

vim.keymap.set('n', '<F12>', '<Plug>(coc-definition)', opts)
vim.keymap.set('n', '<F10>', '<C-o>', opts)



-- git blame
vim.keymap.set('n', '<leader>gb', ':GitBlame<CR>', opts)


vim.keymap.set('n', '<leader>v', ':Vista!!<CR>', opts)
vim.keymap.set('n', '<F9>', ':Vista!!<CR>', opts)

vim.keymap.set('n', 'K', ':call CocAction(\'doHover\')<CR>', opts)

