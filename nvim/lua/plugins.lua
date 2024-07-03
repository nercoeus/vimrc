-- 配置插件


-- Install Packer automatically if it's not installed(Bootstraping)
-- Hint: string concatenation is done by `..`
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end
local packer_bootstrap = ensure_packer()


-- Reload configurations if we modify plugins.lua
-- Hint
--     <afile> - replaced with the filename of the buffer being manipulated
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])


-- Install plugins here - `use ...`
-- Packer.nvim hints
--     after = string or list,           -- Specifies plugins to load before this plugin. See "sequencing" below
--     config = string or function,      -- Specifies code to run after this plugin is loaded
--     requires = string or list,        -- Specifies plugin dependencies. See "dependencies".
--     ft = string or list,              -- Specifies filetypes which load this plugin.
--     run = string, function, or table, -- Specify operations to be run after successful installs/updates of a plugin
return require('packer').startup(function(use)
        -- Packer can manage itself
        use 'wbthomason/packer.nvim'

        ---------------------------------------
        -- NOTE: PUT YOUR THIRD PLUGIN HERE --
        ---------------------------------------
        -- theme
        use 'Mofiqul/dracula.nvim'

        use 'junegunn/vim-easy-align'

        -- git
        use 'airblade/vim-gitgutter'

        use 'jiangmiao/auto-pairs'

        use 'tpope/vim-fireplace'

        use 'vim-autoformat/vim-autoformat'

        -- optional for icons
        use({ "nvim-tree/nvim-web-devicons" })

        -- optional for the 'fzf' command
        use({
          "junegunn/fzf",
          run = function()
          vim.fn["fzf#install"]()
          end,
        })

        use 'junegunn/fzf.vim'
        use({
          'neoclide/coc.nvim',
          run = 'yarn install --frozen-lockfile',
        })

        use 'antoinemadec/coc-fzf'

        use { "ibhagwan/fzf-lua",
          -- optional for icon support
          requires = { "nvim-tree/nvim-web-devicons" }
        }
  
        use 'rkulla/pydiction'

        use 'vim-airline/vim-airline'
        use 'vim-airline/vim-airline-themes'

        use 'fatih/vim-go'

        -- 大文件存在性能问题
        -- use 'majutsushi/tagbar'

        use 'tpope/vim-fugitive'

        -- 大文件存在性能问题
        -- use 'frazrepo/vim-rainbow'
        -- use 'HiPhish/rainbow-delimiters.nvim'

        use 'easymotion/vim-easymotion'

        use 'lukas-reineke/indent-blankline.nvim'

        use 'zivyangll/git-blame.vim'

        use 'joshdick/onedark.vim'

        use 'ryanoasis/vim-devicons'

        use 'liuchengxu/vista.vim'

        use 'nvim-tree/nvim-tree.lua'

        -- Automatically set up your configuration after cloning packer.nvim
        -- Put this at the end after all plugins
        if packer_bootstrap then
            require('packer').sync()
        end
    end)
