vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 8

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.g.tokyonight_style = "night"
vim.g.tokyonight_sidebars = {"terminal", "packer"}
vim.g.tokyonight_dark_sidebar = 1
vim.cmd[[colorscheme tokyonight]]


require('plugins')

-- lualine setup.
require('lualine').setup {
options = {
	theme = 'tokyonight'
	}
}

-- treesitter setup.
require'nvim-treesitter.configs'.setup {
sync_install = false,
highlight = {
	enable = true,
	additional_vim_regex_highlighting = false,
	},
}

-- lspsaga setup.
local saga = require 'lspsaga'
saga.init_lsp_saga()

-- Setup nvim-cmp.
local cmp = require'cmp'

cmp.setup({
	snippet = {
	-- REQUIRED - you must specify a snippet engine
	expand = function(args)
	require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
	end,
	},
	window = {
	-- completion = cmp.config.window.bordered(),
	-- documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' }, -- For luasnip users.
	}, {
		{ name = 'buffer' },
	})
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
	sources = cmp.config.sources({
		{ name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
	}, {
		{ name = 'buffer' },
	})
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = 'buffer' }
	}
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = 'path' }
	}, {
		{ name = 'cmdline' }
	})
})

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require('lspconfig')['clangd'].setup {
    on_attach = on_attach,
	capabilities = capabilities,
    flags = lsp_flags,
}

require('lspconfig')['pyright'].setup {
    on_attach = on_attach,
	capabilities = capabilities,
    flags = lsp_flags,
}

require('lspconfig')['jdtls'].setup {
    on_attach = on_attach,
	capabilities = capabilities,
    flags = lsp_flags,
}

-- Setup autopairs
require("nvim-autopairs").setup {}
