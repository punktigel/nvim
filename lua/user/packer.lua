
-- This file can be loaded by calling `lua require('plugins')` from your init.vim
--
return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'


    -- Plugins
    -- Colorschemes
    use 'Mofiqul/adwaita.nvim'

    use 'tiagovla/tokyodark.nvim'

    use {
        'olivercederborg/poimandres.nvim',
        config = function()
            require('poimandres').setup {
            }
        end
    }

    use 'rose-pine/neovim'

    -- Show color - Edit colorschemes
    use 'norcalli/nvim-colorizer.lua'


    --------------------------------------------------
    -- Git
    use 'tpope/vim-fugitive'

    -- Gitsigns
    use 'lewis6991/gitsigns.nvim'

    -- Harpoon
    use 'ThePrimeagen/harpoon'

    -- Telescope - Fuzzy Finder
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- Treesitter
    use ({'nvim-treesitter/nvim-treesitter',{run = ':TSUpdate'} })


    -- LSP - Language Server Protocol - Autocompletion
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {                                      -- Optional
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},     -- Required
            {'hrsh7th/cmp-nvim-lsp'}, -- Required
            {'L3MON4D3/LuaSnip'},     -- Required
        }
    }


    -- DAP - Debug Adapter Protocol (Dap)
    use 'mfussenegger/nvim-dap'
    use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }


    -- Install debugAdapter
    -- lua
    use 'jbyuki/one-small-step-for-vimkind'

    -- python
    use 'mfussenegger/nvim-dap-python'



    -- Vim practice
    use 'ThePrimeagen/vim-be-good'

end)
