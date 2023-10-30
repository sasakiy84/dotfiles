-- setup vim options
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.keymap.set('i','jj','<Esc>')
vim.keymap.set('n','<C-M-v>','<C-v>')
vim.keymap.set('n', 'gf', '<cmd>lua vim.lsp.buf.formatting()<CR>')
vim.opt.number = true
vim.opt.winblend = 20
vim.opt.pumblend = 20
vim.opt.tabstop = 2
vim.g.mapleader = ' '

-- install plugins
require('lazy_nvim')

-- setup lsp servers
require("mason").setup()
require("mason-lspconfig").setup()

local on_attach = function(client, _bufnr)
  client.server_capabilities.documentFormattingProvider = false
  local set = vim.keymap.set
   set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
   set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
   set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
   set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
   set('n', 'gn', '<cmd>lua vim.lsp.buf.rename()<CR>')
   set('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>')
   set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
   set('n', 'gx', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>')
   set('n', 'g[', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')
   set('n', 'g]', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
   set('n', 'gf', '<cmd>lua vim.lsp.buf.format()<CR>')
end
local capabilities = require("cmp_nvim_lsp").default_capabilities()
require("mason-lspconfig").setup_handlers({
  function (server_name)
    require("lspconfig")[server_name].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })
  end,
})

-- setup completion
local cmp = require("cmp")

cmp.setup({
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.close(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
	}),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
	}, {
		{ name = 'buffer' },
	})
})

-- insert `(` after select function or method item
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)

-- setup beautiful lsp result
require('lspsaga').setup({})

-- setup color schema
vim.cmd[[
let g:everforest_better_performance = 1
colorscheme everforest
]]

-- setup fuzzy search
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

require("telescope").setup {
  extensions = {
    file_browser = {
      theme = "ivy",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        ["i"] = {
          -- your custom insert mode mappings
        },
        ["n"] = {
          -- your custom normal mode mappings
        },
      },
    },
  },
}
-- To get telescope-file-browser loaded and working with telescope,
-- you need to call load_extension, somewhere after setup function:
require("telescope").load_extension "file_browser"
