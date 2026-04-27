-- colorice theme — shado default (regenerate via: colorice <wallpaper> --apply)
-- Usage: place in ~/.config/nvim/colors/colorice.lua
-- then run :colorscheme colorice  or add  vim.cmd("colorscheme colorice")  to init.lua

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then vim.cmd("syntax reset") end
vim.opt.background = "dark"
vim.opt.termguicolors = true
vim.g.colors_name = "colorice"

-- 16-color palette — replaced by colorice on each run
local c = {
  bg       = "#191724",
  fg       = "#e3c7fc",
  cursor   = "#f1c4e0",
  black    = "#140a1d",
  red      = "#B52A5B",
  green    = "#FF4971",
  yellow   = "#8897F4",
  blue     = "#bd93f9",
  magenta  = "#E9729D",
  cyan     = "#F18FB0",
  white    = "#f1c4e0",
  br_black = "#a8899c",
  br_red   = "#B52A5B",
  br_green = "#FF4971",
  br_yellow= "#8897F4",
  br_blue  = "#bd93f9",
  br_mag   = "#E9729D",
  br_cyan  = "#F18FB0",
  br_white = "#f1c4e0",
}

-- UI accent tones — derived from palette
local bg_dim   = "#2a2036"
local bg_light = "#1e1530"
local sel      = "#352b45"
local comment  = "#6e5a7a"
local delim    = "#7e6b8a"
local linenr   = "#4a3c56"
local tab_bg   = "#09090d"
local br_mag2  = "#c4a7e7"

local function hi(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- ── Background & foreground ───────────────────────────────────────────────────

hi("Normal",        { fg = c.fg,    bg = c.bg })
hi("NormalFloat",   { fg = c.fg,    bg = bg_light })
hi("NonText",       { fg = bg_dim })
hi("EndOfBuffer",   { fg = bg_dim })

-- ── Core syntax ───────────────────────────────────────────────────────────────

hi("Comment",       { fg = comment,    italic = true })
hi("Constant",      { fg = c.magenta })
hi("String",        { fg = c.green })
hi("Character",     { fg = c.green })
hi("Number",        { fg = c.magenta })
hi("Float",         { fg = c.magenta })
hi("Boolean",       { fg = c.magenta,  italic = true })

hi("Identifier",    { fg = c.fg })
hi("Function",      { fg = c.cyan,     bold = true })

hi("Statement",     { fg = c.blue,     bold = true })
hi("Keyword",       { fg = c.blue,     bold = true })
hi("Conditional",   { fg = c.blue })
hi("Repeat",        { fg = c.blue })
hi("Label",         { fg = c.blue })
hi("Exception",     { fg = c.red,      bold = true })
hi("Operator",      { fg = c.white })

hi("PreProc",       { fg = c.red })
hi("Include",       { fg = c.red,      italic = true })
hi("Define",        { fg = c.red })
hi("Macro",         { fg = c.red })

hi("Type",          { fg = c.yellow })
hi("StorageClass",  { fg = c.yellow,   italic = true })
hi("Structure",     { fg = c.yellow,   bold = true })
hi("Typedef",       { fg = c.yellow })

hi("Special",       { fg = c.white })
hi("SpecialChar",   { fg = c.magenta,  bold = true })
hi("Delimiter",     { fg = delim })
hi("SpecialComment",{ fg = c.blue,     italic = true })
hi("Tag",           { fg = c.cyan })

hi("Underlined",    { fg = c.blue,     underline = true })
hi("Error",         { fg = c.green,    undercurl = true })
hi("Todo",          { fg = c.bg,       bg = c.yellow, bold = true })

hi("Title",         { fg = c.cyan,     bold = true })
hi("Bold",          { bold = true })
hi("Italic",        { italic = true })

-- ── Python-specific ───────────────────────────────────────────────────────────

hi("pythonBuiltin",       { fg = br_mag2 })
hi("pythonBuiltinFunc",   { fg = br_mag2 })
hi("pythonBuiltinObj",    { fg = br_mag2,   italic = true })
hi("pythonDecorator",     { fg = c.magenta, bold = true })
hi("pythonDecoratorName", { fg = c.magenta })
hi("pythonFunction",      { fg = c.cyan,    bold = true })
hi("pythonClass",         { fg = c.yellow,  bold = true })
hi("pythonException",     { fg = c.red,     bold = true })
hi("pythonExceptions",    { fg = c.red })
hi("pythonRawString",     { fg = c.green,   italic = true })
hi("pythonFString",       { fg = c.green })
hi("pythonStrFormat",     { fg = c.magenta })
hi("pythonSelf",          { fg = c.br_black, italic = true })
hi("pythonDottedName",    { fg = c.fg })

vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  group = vim.api.nvim_create_augroup("ColoriceThemePython", { clear = true }),
  callback = function()
    vim.cmd("syntax keyword pythonSelf self cls containedin=ALL")
    hi("pythonSelf", { fg = c.br_black, italic = true })
  end,
})

-- ── Editor UI ─────────────────────────────────────────────────────────────────

hi("LineNr",        { fg = linenr })
hi("CursorLineNr",  { fg = c.white,  bg = bg_light, bold = true })
hi("CursorLine",    { bg = bg_light })
hi("CursorColumn",  { bg = bg_light })
hi("ColorColumn",   { bg = bg_light })
hi("SignColumn",    {})
hi("VertSplit",     { fg = bg_dim })
hi("Folded",        { fg = c.br_black, bg = bg_light, italic = true })
hi("FoldColumn",    { fg = linenr })

-- ── Selection & search ────────────────────────────────────────────────────────

hi("Visual",        { bg = sel })
hi("VisualNOS",     { bg = sel })
hi("Search",        { fg = c.bg,    bg = c.yellow, bold = true })
hi("IncSearch",     { fg = c.bg,    bg = c.blue,   bold = true })
hi("CurSearch",     { fg = c.bg,    bg = c.cyan,   bold = true })
hi("MatchParen",    { fg = c.white, bg = sel,      bold = true })

-- ── Status line ───────────────────────────────────────────────────────────────

hi("StatusLine",    { fg = c.fg,    bg = bg_light, bold = true })
hi("StatusLineNC",  { fg = comment, bg = tab_bg })

-- ── Tabs ──────────────────────────────────────────────────────────────────────

hi("TabLine",       { fg = comment, bg = tab_bg })
hi("TabLineSel",    { fg = c.fg,    bg = bg_light, bold = true })
hi("TabLineFill",   { bg = tab_bg })

-- ── Popup menu ────────────────────────────────────────────────────────────────

hi("Pmenu",         { fg = c.fg,    bg = bg_light })
hi("PmenuSel",      { fg = c.bg,    bg = c.blue,   bold = true })
hi("PmenuSbar",     { bg = bg_light })
hi("PmenuThumb",    { bg = comment })

-- ── Diff ──────────────────────────────────────────────────────────────────────

hi("DiffAdd",       { fg = c.green,  bg = bg_light })
hi("DiffDelete",    { fg = c.red,    bg = bg_light })
hi("DiffChange",    { fg = c.yellow, bg = bg_light })
hi("DiffText",      { fg = c.fg,     bg = sel,     bold = true })

-- ── Diagnostics / Spell ───────────────────────────────────────────────────────

hi("DiagnosticError",          { fg = c.red })
hi("DiagnosticWarn",           { fg = c.magenta })
hi("DiagnosticInfo",           { fg = c.blue })
hi("DiagnosticHint",           { fg = c.cyan })
hi("DiagnosticUnderlineError", { undercurl = true, sp = c.green })
hi("DiagnosticUnderlineWarn",  { undercurl = true, sp = c.magenta })

hi("SpellBad",      { undercurl = true, sp = c.green })
hi("SpellCap",      { undercurl = true, sp = c.yellow })
hi("SpellRare",     { undercurl = true, sp = c.magenta })
hi("SpellLocal",    { undercurl = true, sp = br_mag2 })

hi("WarningMsg",    { fg = c.magenta })
hi("ErrorMsg",      { fg = c.green,  bold = true })
hi("MoreMsg",       { fg = c.blue })
hi("Question",      { fg = c.blue })
hi("Directory",     { fg = c.yellow })

-- ── Misc ──────────────────────────────────────────────────────────────────────

hi("WildMenu",      { fg = c.bg,    bg = c.blue,  bold = true })
hi("Conceal",       { fg = comment })
hi("SpecialKey",    { fg = bg_dim })
