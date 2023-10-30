return {
	"neovim/nvim-lspconfig",
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	{ "L3MON4D3/LuaSnip" },
	{ "hrsh7th/nvim-cmp" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-buffer" },
	{ "saadparwaiz1/cmp_luasnip" },
	{
  		'nvimdev/lspsaga.nvim',
	},
	{
		'sainnhe/everforest'
	},
	{
		'nvim-treesitter/nvim-treesitter'
	},
	{
		'windwp/nvim-autopairs',
		event = "InsertEnter",
    		opts = {}
	},
	{
		"j-hui/fidget.nvim",
  		tag = "legacy",
  		event = "LspAttach",
  		opts = {
  		  -- options
  		},
	},
	{
    		'numToStr/Comment.nvim',
		opts = {
			-- add any options here
	   	},
	   	lazy = false,
	},
	{
		'nvim-telescope/telescope.nvim',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},
	{
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  }
}
