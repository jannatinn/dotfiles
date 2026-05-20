vim.opt.breakindent=true
vim.opt.confirm=true
vim.opt.cursorline=true
vim.opt.expandtab=true
vim.opt.mouse="a"
vim.opt.number=true
vim.opt.scrolloff=8
vim.opt.sidescrolloff=8
vim.opt.shiftwidth=4
vim.opt.shortmess:append("I")
vim.opt.smartcase=true
vim.opt.smartindent=true
vim.opt.softtabstop=4
vim.opt.splitbelow=true
vim.opt.splitright=true
vim.opt.tabstop=4
vim.opt.termguicolors=true
vim.opt.timeoutlen=280

vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set({"n", "v"}, "<leader>p", [["+p]])

vim.pack.add({
    "https://github.com/ellisonleao/gruvbox.nvim",
    "https://github.com/wakatime/vim-wakatime",
})

require("gruvbox").setup({
    transparent_mode = true,
})
vim.cmd("colorscheme gruvbox")
