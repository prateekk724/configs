return require('packer').startup(function()
	use {'wbthomason/packer.nvim'}
	use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
	use {'neovim/nvim-lspconfig'}
	use {'glepnir/lspsaga.nvim', branch = 'main'}
	use {'hrsh7th/nvim-cmp'}
	use {'hrsh7th/cmp-nvim-lsp'}
	use {'hrsh7th/cmp-buffer'}
	use {'hrsh7th/cmp-path'}
	use {'hrsh7th/cmp-cmdline'}
	use {'L3MON4D3/LuaSnip'}
	use {'nvim-lualine/lualine.nvim'}
    use {'folke/tokyonight.nvim'}
    use {'nvim-lua/plenary.nvim'}
    use {'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { {'nvim-lua/plenary.nvim'} }}
    use {'windwp/nvim-autopairs'}
end)
