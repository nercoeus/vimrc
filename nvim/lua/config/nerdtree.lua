
-- 显示隐藏文件
vim.g.NERDTreeShowHidden = 1

vim.keymap.set('n', '<F6>', ':NERDTreeMirror<CR>', opts)
vim.keymap.set('n', '<F6>', ':NERDTreeToggle<CR>', opts)


vim.g.NERDTreeGitStatusIndicatorMapCustom = {
    ["Modified"] = "✹",
    ["Staged"] = "✚",
    ["Untracked"] = "✭",
    ["Renamed"] =  "➜",
    ["Unmerged"] =  "═",
    ["Deleted"] = "✖",
    ["Dirty"] =  "✗",
    ["Clean"] = "✔︎",
    ["Ignored"] =  "☒",
    ["Unknown"] =  "?"
}
