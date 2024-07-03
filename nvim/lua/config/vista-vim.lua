
-- 启用悬浮窗预览
vim.g.vista_echo_cursor_strategy = 'floating_win'

-- 跳转到一个符号时，自动关闭vista窗口.
vim.g.vista_close_on_jump = 0

--打开vista窗口后移动到它.
vim.g.vista_stay_on_open = 1

-- 跳转到标记后闪烁光标2次，间隔100ms.
-- vim.g.vista_blink = {2, 0}

vim.g.vista_default_executive = 'ctags'

-- 展示样式
vim.g.vista_icon_indent = {"╰─▸ ", "├─▸ "}

vim.g.vista_ctags_cmd = {['haskell'] = 'hasktags -x -o - -c'}

vim.g.vista_fzf_preview = {'right:50%'}

vim.g['vista#renderer#enable_icon'] = 1

vim.g['vista#renderer#icons'] = {
    ["function"] = "\uf794",
    ["variable"]= "\uf71b",
}

