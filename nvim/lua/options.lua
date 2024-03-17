-- 配置选项

-- Hint: use `:h <option>` to figure out the meaning if needed
vim.opt.clipboard = 'unnamedplus' -- use system clipboard
vim.opt.completeopt = { 'menu', 'menuone', 'noselect', 'preview', 'longest' }
vim.opt.mouse = 'a' -- allow the mouse to be used in Nvim
vim.opt.modeline = true
vim.opt.encoding = 'utf8'
vim.opt.smartindent = true
-- vim.opt.nocompatible = false

-- Tab
vim.opt.tabstop = 4 -- number of visual spaces per TAB
vim.opt.softtabstop = 4 -- number of spacesin tab when editing
vim.opt.shiftwidth = 4 -- insert 4 spaces on a tab
vim.opt.expandtab = true -- tabs are spaces, mainly because of python
vim.opt.autoindent = true -- 继承前一行的缩进方式，适用于多行注释
vim.opt.backspace = '2'

-- UI config
vim.opt.ruler = true
vim.opt.showmatch = true -- 显示括号匹配
vim.opt.showcmd = true
vim.opt.number = true -- show absolute number
vim.opt.relativenumber = true -- add numbers to each line on the left side
vim.opt.cursorline = true -- highlight cursor line underneath the cursor horizontally
vim.opt.splitbelow = true -- open new vertical split bottom
vim.opt.splitright = true -- open new horizontal splits right
-- vim.opt.termguicolors = true        -- enabl 24-bit RGB color in the TUI
vim.opt.showmode = false -- we are experienced, wo don't need the "-- INSERT --" mode hint
-- 设置 laststatus = 0 ，不显式状态行
-- 设置 laststatus = 1 ，仅当窗口多于一个时，显示状态行
-- 设置 laststatus = 2 ，总是显式状态行
vim.opt.laststatus = 2

-- Searching
vim.opt.incsearch = true -- search as characters are entered
vim.opt.hlsearch = true -- do not highlight matches
vim.opt.ignorecase = true -- ignore case in searches by default
vim.opt.smartcase = true -- but make it case sensitive if an uppercase is entered

-- time
vim.opt.timeoutlen = 1000
vim.opt.ttimeoutlen = 0


vim.g.autoformat_verbosemode = 1

vim.g.formatdef_gofmt_1 = '"gofmt"'

-- python config
vim.g.python3_host_prog = "/usr/local/bin/python3"
vim.g.pydiction_location = '/data00/home/zhiwei.li/.vim/plugged/pydiction/complete-dict'

-- 每次打开文件都从上次退出位置开始编辑
vim.api.nvim_create_autocmd("BufReadPost", {
    pattern = "*",
    callback = function()
        if vim.fn.line("'\"") > 0 and vim.fn.line("'\"") <= vim.fn.line("$") then
            vim.fn.setpos(".", vim.fn.getpos("'\""))
            vim.cmd("silent! foldopen")
        end
    end,
})

-- 自动保存
local auto_save = true
if auto_save then
    vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
        pattern = { "*" },
        command = "silent! wall",
        nested = true,
    })
end

vim.g.loaded_perl_provider = 0
