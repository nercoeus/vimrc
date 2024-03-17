-- ======== files ========

-- find files, filter hidden and ignored files
vim.keymap.set('n', '<space>f', '<cmd>FzfxFiles<cr>',
        {silent=true, noremap=true, desc="Find files"})
-- by visual selected
vim.keymap.set('x', '<space>f', '<cmd>FzfxFilesV<CR>',
        {silent=true, noremap=true, desc="Find files"})
-- unrestrictly find files, include hidden and ignored files
vim.keymap.set('n', '<space>uf',
        '<cmd>FzfxFilesU<cr>',
        {silent=true, noremap=true, desc="Unrestricted find files"})
-- unrestrictly by visual selected
vim.keymap.set('x', '<space>uf',
        '<cmd>FzfxFilesUV<CR>',
        {silent=true, noremap=true, desc="Unrestricted find files"})

-- by cursor word
vim.keymap.set('n', '<space>wf', '<cmd>FzfxFilesW<cr>',
        {silent=true, noremap=true, desc="Find files by cursor word"})
-- unrestrictly by cursor word
vim.keymap.set('n', '<space>uwf', '<cmd>FzfxFilesUW<cr>',
        {silent=true, noremap=true, desc="Unrestricted find files by cursor word"})

-- ======== history files ========

-- find history files
vim.keymap.set('n', '<space>hf', '<cmd>FzfxHistoryFiles<cr>',
        {silent=true, noremap=true, desc="Find history files"})
-- by visual selected
vim.keymap.set('x', '<space>hf', '<cmd>FzfxHistoryFilesV<CR>',
        {silent=true, noremap=true, desc="Find history files"})
-- by cursor word
vim.keymap.set('n', '<space>m', '<cmd>FzfxHistoryFilesW<CR>',
        {silent=true, noremap=true, desc="Find history files by cursor word"})

-- ======== buffers ========

-- find buffers
vim.keymap.set('n', '<space>b', '<cmd>FzfxBuffers<cr>',
        {silent=true, noremap=true, desc="Find buffers"})
-- by visual selected
vim.keymap.set('x', '<space>b', '<cmd>FzfxBuffersV<cr>',
        {silent=true, noremap=true, desc="Find buffers"})
-- by cursor word
vim.keymap.set('n', '<space>wb', '<cmd>FzfxBuffersW<cr>',
        {silent=true, noremap=true, desc="Find buffers by cursor word"})

-- ======== live grep ========

-- live grep, filter hidden and ignored files
vim.keymap.set('n', '<space>l',
        '<cmd>FzfxLiveGrep<cr>',
        {silent=true, noremap=true, desc="Live grep"})
-- by visual selected
vim.keymap.set('x', '<space>l',
        "<cmd>FzfxLiveGrepV<cr>",
        {silent=true, noremap=true, desc="Live grep"})
-- unrestrictly live grep, include hidden and ignored files
vim.keymap.set('n', '<space>ul',
        '<cmd>FzfxLiveGrepU<cr>',
        {silent=true, noremap=true, desc="Unrestricted live grep"})
-- unrestrictly by visual selected
vim.keymap.set('x', '<space>ul',
        "<cmd>FzfxLiveGrepUV<cr>",
        {silent=true, noremap=true, desc="Live grep"})

-- by cursor word
vim.keymap.set('n', '<space>wl',
        '<cmd>FzfxLiveGrepW<cr>',
        {silent=true, noremap=true, desc="Live grep under cursor word"})
-- unrestrictly by cursor word
vim.keymap.set('n', '<space>uwl',
        '<cmd>FzfxLiveGrepUW<cr>',
        {silent=true, noremap=true, desc="Unrestricted live grep under cursor word"})

-- ======== git branches ========

-- search git branches
vim.keymap.set('n', '<space>gb', '<cmd>FzfxBranches<cr>',
        {silent=true, noremap=true, desc="Search git branches"})
-- by visual selected
vim.keymap.set('x', '<space>gb', '<cmd>FzfxBranchesV<cr>',
        {silent=true, noremap=true, desc="Search git branches"})
-- by cursor word
vim.keymap.set('n', '<space>wgb', '<cmd>FzfxBranchesW<cr>',
        {silent=true, noremap=true, desc="Search git branches by cursor word"})

-- ======== vim commands ========

-- search vim commands
vim.keymap.set('n', '<space>cm', '<cmd>FzfxCommands<cr>',
        {silent=true, noremap=true, desc="Search vim commands"})
-- by visual selected
vim.keymap.set('x', '<space>cm', '<cmd>FzfxCommandsV<cr>',
        {silent=true, noremap=true, desc="Search vim commands"})
-- by cursor word
vim.keymap.set('n', '<space>wcm', '<cmd>FzfxCommandsW<cr>',
        {silent=true, noremap=true, desc="Search vim commands by cursor word"})
