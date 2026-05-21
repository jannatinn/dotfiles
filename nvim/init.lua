vim.opt.breakindent = true
vim.opt.confirm = true
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·" }
vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.shiftwidth = 4
vim.opt.shortmess:append("I")
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.softtabstop = 4
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.tabstop = 4
vim.opt.termguicolors = true
vim.opt.timeoutlen = 280

vim.keymap.set({ "n", "v" }, "y", [["+Y]])
vim.keymap.set({ "n", "v" }, "p", [["+p]])

vim.pack.add({
	"https://github.com/ellisonleao/gruvbox.nvim",
	"https://github.com/wakatime/vim-wakatime",
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/mason-org/mason-lspconfig.nvim",
	"https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",
	"https://github.com/stevearc/conform.nvim",
	"https://github.com/saghen/blink.cmp",
	"https://github.com/saghen/blink.lib",
	"https://github.com/lukas-reineke/indent-blankline.nvim",
})

require("gruvbox").setup({
	transparent_mode = true,
})
vim.cmd("colorscheme gruvbox")

require("ibl").setup()

vim.lsp.config("lua_ls", {
	---@type lspconfig.settings.lua_ls
	settings = {
		Lua = {
			runtime = { version = "LuaJIT" },
			workspace = {
				preloadFileSize = 10000,
				library = vim.api.nvim_get_runtime_file("*", true),
				checkThirdParty = false,
			},
		},
	},
})

vim.lsp.config("clangd", {
	---@type lspconfig.settings.clangd
	settings = {},
})

require("mason").setup()
require("mason-tool-installer").setup({
	ensure_installed = {
		"stylua",
		"clang-format",
	},
})
require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"clangd",
	},
})

vim.diagnostic.config({
	virtual_text = {},
})
vim.keymap.set("n", "gl", vim.diagnostic.open_float)

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		c = { "clang_format" },
	},
	formatters = {
		clang_format = {
			prepend_args = { "--style=file" },
		},
	},
	format_on_save = {
		timeout_ms = 2000,
		lsp_format = "fallback",
	},
})
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})

require("blink.cmp").build():wait(1000 * 60)
require("blink.cmp").setup({
	keymap = {
		preset = "enter",
	},
})
