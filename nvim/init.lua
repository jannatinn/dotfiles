vim.g.mapleader = " "

vim.opt.background = "dark"
vim.opt.breakindent = true
vim.opt.colorcolumn = "120"
vim.opt.confirm = true
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·" }
vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.signcolumn = "auto:2"
vim.opt.shiftwidth = 4
vim.opt.shortmess:append("I")
vim.opt.showmode = false
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.softtabstop = 4
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.tabstop = 4
vim.opt.termguicolors = true
vim.opt.timeoutlen = 280

vim.keymap.set({ "n", "v" }, "j", "gj")
vim.keymap.set({ "n", "v" }, "k", "gk")

vim.keymap.set({ "n", "v" }, "<leader>y", '"+y')
vim.keymap.set({ "n", "v" }, "<leader>p", '"+p')

vim.keymap.set({ "n" }, "<Esc>", "<Cmd>nohlsearch<CR>")

vim.keymap.set({ "n" }, "<leader>w", "<Cmd>w<CR>")
vim.keymap.set({ "n" }, "<leader>q", "<Cmd>q<CR>")

local gh = function(repository)
	return "https://github.com/" .. repository
end

vim.pack.add({
	gh("wakatime/vim-wakatime"),

	gh("ellisonleao/gruvbox.nvim"),

	gh("neovim/nvim-lspconfig"),
	gh("mason-org/mason.nvim"),
	gh("mason-org/mason-lspconfig.nvim"),
	gh("WhoIsSethDaniel/mason-tool-installer.nvim"),

	gh("stevearc/conform.nvim"),
	gh("saghen/blink.cmp"),
	gh("saghen/blink.lib"),

	gh("romgrk/barbar.nvim"),
	gh("nvim-lualine/lualine.nvim"),
	gh("nvim-neo-tree/neo-tree.nvim"),
	gh("nvim-telescope/telescope.nvim"),

	gh("HiPhish/rainbow-delimiters.nvim"),
	gh("lukas-reineke/indent-blankline.nvim"),
	gh("lewis6991/gitsigns.nvim"),

	gh("nvim-mini/mini.nvim"),

	gh("MunifTanjim/nui.nvim"),
	gh("nvim-tree/nvim-web-devicons"),
	gh("nvim-lua/plenary.nvim"),
})

require("wakatime").setup({ status_bar_enabled = false })

require("gruvbox").setup({ transparent_mode = true })
vim.cmd("colorscheme gruvbox")

vim.lsp.config("lua_ls", {
	---@type lspconfig.settings.lua_ls
	settings = {
		Lua = {
			runtime = { version = "LuaJIT" },
			workspace = {
				preloadFileSize = 10000,
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
		},
	},
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

vim.diagnostic.config({ virtual_text = true })
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
	notify_on_error = false,
	notify_no_formatters = false,
})
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})

require("blink.cmp").build():wait(1000 * 60)
require("blink.cmp").setup({ keymap = { preset = "enter" } })

require("barbar").setup({
	auto_hide = 0,
	animation = false,
	focus_on_close = "previous",
	highlight_visible = false,
	sidebar_filetypes = {
		["neo-tree"] = { event = "BufWipeout" },
	},
})
vim.keymap.set("n", "<S-l>", "<Cmd>BufferNext<CR>")
vim.keymap.set("n", "<S-h>", "<Cmd>BufferPrevious<CR>")
vim.keymap.set("n", "<leader>c", "<Cmd>BufferClose<CR>")

require("lualine").setup({
	options = {
		globalstatus = true,
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
	},
	extensions = { "man", "mason", "quickfix" },
	sections = { lualine_y = {} },
})

require("neo-tree").setup({
	window = { position = "right", width = 28 },
	filesystem = {
		filtered_items = {
			hide_dotfiles = false,
			hide_gitignored = false,
			ignored = false,
		},
	},
})
vim.keymap.set({ "n" }, "<leader>e", "<Cmd>Neotree toggle<CR>")

require("telescope").setup({
	pickers = {
		find_files = { hidden = true, no_ignore = false },
	},
})
local telescope_builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", telescope_builtin.find_files)
vim.keymap.set("n", "<leader>fg", telescope_builtin.live_grep)
vim.keymap.set("n", "<leader>fh", telescope_builtin.help_tags)

require("ibl").setup()
require("rainbow-delimiters.setup").setup({})

require("gitsigns").setup({
	attach_to_untracked = true,
	current_line_blame = true,
})

require("mini.ai").setup()
require("mini.comment").setup()
require("mini.pairs").setup()
require("mini.splitjoin").setup()
require("mini.surround").setup()
