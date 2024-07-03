local M = {}

vim.keymap.set('n', '<F6>', ':NvimTreeToggle<CR>', opts)
vim.keymap.set('n', '<F6>', ':NvimTreeToggle<CR>', opts)

vim.cmd [[
  hi      NvimTreeFolderIcon     guifg=#8be9fd  gui=italic
  hi      NvimTreeFolderName     guifg=#8be9fd  gui=italic
  hi      NvimTreeOpenedFolderIcon     guifg=#8be9fd  gui=italic
  hi      NvimTreeClosedFolderIcon     guifg=#8be9fd  gui=italic
  hi      NvimTreeFolderArrowClosed     guifg=#8be9fd  gui=italic
  hi      NvimTreeFolderArrowOpen     guifg=#8be9fd  gui=italic
  hi      NvimTreeRootFolder     guifg=#8be9fd  gui=italic
  hi      NvimTreeFolderName     guifg=#8be9fd  gui=italic
  hi      NvimTreeEmptyFolderName     guifg=#8be9fd  gui=italic
  hi      NvimTreeOpenedFolderName     guifg=#8be9fd  gui=italic
  hi      NvimTreeSymlinkFolderName     guifg=#8be9fd  gui=italic
  hi      NvimTreeFileIcon     guifg=#f0bb7c  gui=italic
  hi      NvimTreeSymlinkIcon     guifg=#f0bb7c  gui=italic
]]

vim.api.nvim_create_autocmd("BufEnter", {
  group = vim.api.nvim_create_augroup("NvimTreeClose", {clear = true}),
  pattern = "NvimTree_*",
  callback = function()
    local layout = vim.api.nvim_call_function("winlayout", {})
    if layout[1] == "leaf" and vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(layout[2]), "filetype") == "NvimTree" and layout[3] == nil then vim.cmd("confirm quit") end
  end
})

local function my_on_attach(bufnr)
    local api = require "nvim-tree.api"

    local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    -- default mappings
    api.config.mappings.default_on_attach(bufnr)

    -- custom mappings
    vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent,        opts('Up'))
    vim.keymap.set('n', '?',     api.tree.toggle_help,                  opts('Help'))
end

function M.setup()
    local tree = require("nvim-tree")

    tree.setup({
        on_attach = my_on_attach,
        hijack_cursor = true,
        sync_root_with_cwd = true,
        view = {
            adaptive_size = false,
        },
        renderer = {
            full_name = true,
            group_empty = true,
            symlink_destination = false,
            indent_markers = {
                enable = true,
            },
            special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
            icons = {
                git_placement = "signcolumn",
                web_devicons = {
                    file = {
                        enable = true,
                        color = false,
                    },
                    folder = {
                        enable = false,
                        color = false,
                    },
                },
                show = {
                    file = true,
                    folder = true,
                    folder_arrow = true,
                    git = true,
                },
                glyphs = {
                    bookmark = " ",
                    folder = {
                        arrow_closed = "⏵",
                        arrow_open = "⏷",
                    },
                    git = {
                        unstaged = "✗",
                        staged = "✓",
                        unmerged = "⌥",
                        renamed = "➜",
                        untracked = "★",
                        deleted = "⊖",
                        ignored = "◌",
                    },
                },
            },
        },
        update_focused_file = {
            enable = true,
            update_root = true,
            ignore_list = { "help" },
        },
        diagnostics = {
            enable = true,
            show_on_dirs = true,
        },
        filters = {
            custom = {
                --     "^.git$",
            },
        },
        actions = {
            change_dir = {
                enable = true,
                restrict_above_cwd = true,
            },
            open_file = {
                resize_window = true,
                window_picker = {
                    chars = "aoeui",
                },
            },
            remove_file = {
                close_window = false,
            },
        },
        log = {
            enable = false,
            truncate = true,
            types = {
                all = false,
                config = false,
                copy_paste = false,
                diagnostics = false,
                git = false,
                profile = false,
                watcher = false,
            },
        },
    })
end

return M

