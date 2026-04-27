-- ── Disable netrw (nvim-tree takes over file browsing) ─────────────────────
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- ── Options ─────────────────────────────────────────────────────────────────
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.foldmethod = "indent"
vim.opt.foldlevelstart = 99
vim.opt.scrolloff = 8        -- keep 8 lines of context above/below cursor
vim.opt.signcolumn = "yes"   -- always show gutter so LSP signs don't shift text

-- ── Leader key ───────────────────────────────────────────────────────────────
vim.g.mapleader = " "

-- ── Keybindings ──────────────────────────────────────────────────────────────
local map = function(lhs, rhs)
  vim.keymap.set("n", lhs, rhs, { noremap = true, silent = true })
end

map("<leader>q", ":bd<CR>")       -- close current buffer
map("<leader>n", ":bn<CR>")       -- next buffer
map("<leader>p", ":bp<CR>")       -- previous buffer
map("<leader>w", ":w<CR>")        -- save file

-- ── Bootstrap lazy.nvim ──────────────────────────────────────────────────────
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- ── Load plugins (each file in lua/plugins/ is auto-imported) ────────────────
require("lazy").setup("plugins")

-- ── Colorscheme ──────────────────────────────────────────────────────────────
vim.cmd("colorscheme colorice")
