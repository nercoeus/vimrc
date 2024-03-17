
-----------------------
------- airline -------
-----------------------

vim.g['airline#extensions#tabline#enabled'] = 1
-- let g:airline#extensions#tabline#formatter = 'unique_tail'
-- let g:airline#extensions#tabline#buffer_nr_show = 1        "显示buffer编号
vim.g['airline#extensions#tabline#buffer_nr_format'] = '%s:'
vim.g['airline#extensions#battery#enabled'] = 1
vim.g.airline_theme='onedark'       -- 需要安装joshdick/onedark.vim主题插件

vim.g.airline_powerline_fonts = 1  -- 支持 powerline 字体

vim.g.airline_left_sep = '▶'
vim.g.airline_left_alt_sep = '❯'
vim.g.airline_right_sep = '◀'
vim.g.airline_right_alt_sep = '❮'
vim.g.airline_symbols = {
    ['linenr'] = '-',
    ['branch'] = '⎇',
    ['maxlinenr'] = ''
}
vim.g['airline_section_c_only_filename'] = 1

vim.g['airline#extensions#tabline#buffer_idx_mode'] = 1
vim.g['airline#extensions#tabline#buffer_idx_format'] = {
    ['0']='0 ',
    ['1']='1 ',
    ['2']='2 ',
    ['3']='3 ',
    ['4']='4 ',
    ['5']='5 ',
    ['6']='6 ',
    ['7']='7 ',
    ['8']='8 ',
    ['9']='9 '
}
