local status, packer = pcall(require, 'packer')
if (not status) then
    print("Packer is not installed")
    return
end

vim.cmd [[ packadd packer.nvim ]]
packer.startup(function(use)
    use 'wbthomason/packer.nvim' -- package manager

    -- aesthetic related plugins
    use 'hoob3rt/lualine.nvim' -- status line
    use 'folke/tokyonight.nvim' -- color theme
    use 'kyazdani42/nvim-web-devicons' -- File icons
    use 'akinsho/bufferline.nvim' -- tabs
    use 'norcalli/nvim-colorizer.lua' -- css codes

    -- lsp related plugins

    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    }

    -- autocompletion related plugins
    use 'L3MON4D3/LuaSnip' -- snippets engine
    use 'onsails/lspkind-nvim' -- vscode-like pictograms
    use 'hrsh7th/cmp-buffer' -- nvim-cmp source for buffer words
    use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim's built-in lsp
    use 'hrsh7th/nvim-cmp' -- Completion
    use 'jose-elias-alvarez/null-ls.nvim'

    -- cool plugins
    use 'jiangmiao/auto-pairs' -- auto close parenthesis and other brackets
    use 'andweeb/presence.nvim' -- discord rich presence
    use 'mattn/emmet-vim' -- complete html tags

    -- fuzzy finder
    use 'nvim-lua/plenary.nvim' -- Common utilities
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-telescope/telescope-file-browser.nvim'

    --file tree
    use 'nvim-tree/nvim-tree.lua'
end)
