vim.g.mapleader = " "

vim.opt.background = "dark"
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

vim.keymap.set({ "n", "v" }, "<leader>y", [["+Y]])
vim.keymap.set({ "n", "v" }, "<leader>p", [["+p]])

vim.keymap.set({ "n" }, "<Esc>", "<Cmd>nohlsearch<CR>")

local gh = function(repository)
	return "https://github.com/" .. repository
end

vim.pack.add({
	gh("ellisonleao/gruvbox.nvim"),
	gh("wakatime/vim-wakatime"),
	gh("neovim/nvim-lspconfig"),
	gh("mason-org/mason.nvim"),
	gh("mason-org/mason-lspconfig.nvim"),
	gh("WhoIsSethDaniel/mason-tool-installer.nvim"),
	gh("stevearc/conform.nvim"),
	gh("saghen/blink.cmp"),
	gh("saghen/blink.lib"),
	gh("nvim-neo-tree/neo-tree.nvim"),
	gh("nvim-telescope/telescope.nvim"),
	gh("nvim-telescope/telescope-fzf-native.nvim"),
	gh("nvim-lualine/lualine.nvim"),
	gh("romgrk/barbar.nvim"),
	gh("lukas-reineke/indent-blankline.nvim"),
	gh("windwp/nvim-autopairs"),
	gh("folke/snacks.nvim"),
	gh("nvim-mini/mini.surround"),
	gh("MunifTanjim/nui.nvim"),
	gh("nvim-lua/plenary.nvim"),
	gh("lewis6991/gitsigns.nvim"),
	gh("nvim-tree/nvim-web-devicons"),
})

local hooks = function(ev)
	local name, kind = ev.data.spec.name, ev.data.kind
	if name == "telescope-fzf-native.nvim" and (kind == "install" or kind == "update") then
		vim.system({ "make" }, { cwd = ev.data.path }):wait(1000 * 60)
	end
end
vim.api.nvim_create_autocmd("PackChanged", { callback = hooks })

require("snacks").setup()

require("mini.surround").setup()

require("wakatime").setup({ status_bar_enabled = false })

require("gruvbox").setup({ transparent_mode = true })
vim.cmd("colorscheme gruvbox")

require("neo-tree").setup({
	filesystem = {
		filtered_items = {
			hide_dotfiles = false,
			hide_gitignored = false,
			ignored = false,
		},
	},
})
vim.keymap.set({ "n" }, "<leader>e", "<Cmd>Neotree toggle<CR>")

require("lualine").setup({
	options = {
		globalstatus = true,
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
	},
	extensions = { "man", "mason", "quickfix" },
})

require("barbar").setup({
	animation = false,
	auto_hide = 1,
	highlight_visible = false,
	sidebar_filetypes = {
		["neo-tree"] = { event = "BufWipeout" },
	},
})
vim.keymap.set("n", "<S-l>", "<Cmd>BufferNext<CR>")
vim.keymap.set("n", "<S-h>", "<Cmd>BufferPrevious<CR>")
vim.keymap.set("n", "<leader>c", "<Cmd>BufferClose<CR>")

require("telescope").setup({
	defaults = {
		file_ignore_patterns = { "^.git/" },
	},
	pickers = {
		find_files = {
			hidden = true,
			no_ignore = false,
		},
	},
})
local telescope = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", telescope.find_files)
vim.keymap.set("n", "<leader>fg", telescope.live_grep)
vim.keymap.set("n", "<leader>fb", telescope.buffers)
vim.keymap.set("n", "<leader>fh", telescope.help_tags)

require("ibl").setup()

require("nvim-autopairs").setup()

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
