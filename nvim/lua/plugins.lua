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

        use 'junegunn/fzf.vim' -- needed for previews
        use({
          'neoclide/coc.nvim',
          run = 'yarn install --frozen-lockfile',
        })
        use 'antoinemadec/coc-fzf'

        use { "ibhagwan/fzf-lua",
          -- optional for icon support
          requires = { "nvim-tree/nvim-web-devicons" }
        }

        --use({
        --  "linrongbin16/fzfx.nvim",
        --  -- specify version to avoid break changes
        --  version = 'v5.0.0',
        --  config = function()
        --    require("fzfx").setup()
        --  end,
        --})
  
        use 'rkulla/pydiction'

        use 'vim-airline/vim-airline'
        use 'vim-airline/vim-airline-themes'

        -- vim-go的极简版，去除了gopls，以及所有coc拥有的功能
        use 'fioncat/vim-minigo'
        -- use 'fatih/vim-go'

        use 'majutsushi/tagbar'

        use 'tpope/vim-fugitive'

        use 'frazrepo/vim-rainbow'

        use 'easymotion/vim-easymotion'

        use 'lukas-reineke/indent-blankline.nvim'

        use 'zivyangll/git-blame.vim'

        use 'neoclide/coc.nvim'

        use 'joshdick/onedark.vim'

        use 'scrooloose/nerdtree'
        use 'ryanoasis/vim-devicons'
        -- 可以使 nerdtree 的 tab 更加友好些
        use 'jistr/vim-nerdtree-tabs'
        -- 目录树展示 git 状态
        use 'Xuyuanp/nerdtree-git-plugin'

        -- Automatically set up your configuration after cloning packer.nvim
        -- Put this at the end after all plugins
        if packer_bootstrap then
            require('packer').sync()
        end
    end)
