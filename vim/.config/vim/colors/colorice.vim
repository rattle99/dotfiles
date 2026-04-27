" colorice theme — shado default (regenerate via: colorice <wallpaper> --apply)
" Usage: place in ~/.config/vim/colors/colorice.vim
" then add `colorscheme colorice` to ~/.vimrc or ~/.config/vim/vimrc

highlight clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "colorice"

" 16-color palette — replaced by colorice on each run
let s:bg       = "#191724"
let s:fg       = "#e3c7fc"
let s:cursor   = "#f1c4e0"
let s:black    = "#140a1d"
let s:red      = "#B52A5B"
let s:green    = "#FF4971"
let s:yellow   = "#8897F4"
let s:blue     = "#bd93f9"
let s:magenta  = "#E9729D"
let s:cyan     = "#F18FB0"
let s:white    = "#f1c4e0"
let s:br_black = "#a8899c"
let s:br_red   = "#B52A5B"
let s:br_green = "#FF4971"
let s:br_yellow= "#8897F4"
let s:br_blue  = "#bd93f9"
let s:br_mag   = "#E9729D"
let s:br_cyan  = "#F18FB0"
let s:br_white = "#f1c4e0"

" UI accent tones — derived from palette
let s:bg_dim   = "#2a2036"
let s:bg_light = "#1e1530"
let s:sel      = "#352b45"
let s:comment  = "#6e5a7a"
let s:delim    = "#7e6b8a"
let s:linenr   = "#4a3c56"
let s:tab_bg   = "#09090d"
let s:br_mag2  = "#c4a7e7"

" ── Background & foreground ───────────────────────────────────────────────────

execute "highlight Normal        guifg=" . s:fg      . " guibg=" . s:bg
execute "highlight NonText       guifg=" . s:bg_dim
execute "highlight EndOfBuffer   guifg=" . s:bg_dim

" ── Core syntax ───────────────────────────────────────────────────────────────

execute "highlight Comment       guifg=" . s:comment . " gui=italic cterm=italic"
execute "highlight Constant      guifg=" . s:magenta
execute "highlight String        guifg=" . s:green
execute "highlight Character     guifg=" . s:green
execute "highlight Number        guifg=" . s:magenta
execute "highlight Float         guifg=" . s:magenta
execute "highlight Boolean       guifg=" . s:magenta . " gui=italic cterm=italic"

execute "highlight Identifier    guifg=" . s:fg
execute "highlight Function      guifg=" . s:cyan    . " gui=bold cterm=bold"

execute "highlight Statement     guifg=" . s:blue    . " gui=bold cterm=bold"
execute "highlight Keyword       guifg=" . s:blue    . " gui=bold cterm=bold"
execute "highlight Conditional   guifg=" . s:blue
execute "highlight Repeat        guifg=" . s:blue
execute "highlight Label         guifg=" . s:blue
execute "highlight Exception     guifg=" . s:red     . " gui=bold cterm=bold"
execute "highlight Operator      guifg=" . s:white

execute "highlight PreProc       guifg=" . s:red
execute "highlight Include       guifg=" . s:red     . " gui=italic cterm=italic"
execute "highlight Define        guifg=" . s:red
execute "highlight Macro         guifg=" . s:red

execute "highlight Type          guifg=" . s:yellow
execute "highlight StorageClass  guifg=" . s:yellow  . " gui=italic cterm=italic"
execute "highlight Structure     guifg=" . s:yellow  . " gui=bold cterm=bold"
execute "highlight Typedef       guifg=" . s:yellow

execute "highlight Special       guifg=" . s:white
execute "highlight SpecialChar   guifg=" . s:magenta . " gui=bold cterm=bold"
execute "highlight Delimiter     guifg=" . s:delim
execute "highlight SpecialComment guifg=" . s:blue   . " gui=italic cterm=italic"
execute "highlight Tag           guifg=" . s:cyan

execute "highlight Underlined    guifg=" . s:blue    . " gui=underline cterm=underline"
execute "highlight Error         guifg=" . s:green   . " gui=undercurl cterm=undercurl"
execute "highlight Todo          guifg=" . s:bg      . " guibg=" . s:yellow . " gui=bold cterm=bold"

execute "highlight Title         guifg=" . s:cyan    . " gui=bold cterm=bold"
highlight Bold   gui=bold   cterm=bold
highlight Italic gui=italic cterm=italic

" ── Python-specific ───────────────────────────────────────────────────────────

execute "highlight pythonBuiltin       guifg=" . s:br_mag2
execute "highlight pythonBuiltinFunc   guifg=" . s:br_mag2
execute "highlight pythonBuiltinObj    guifg=" . s:br_mag2  . " gui=italic cterm=italic"
execute "highlight pythonDecorator     guifg=" . s:magenta  . " gui=bold cterm=bold"
execute "highlight pythonDecoratorName guifg=" . s:magenta
execute "highlight pythonFunction      guifg=" . s:cyan     . " gui=bold cterm=bold"
execute "highlight pythonClass         guifg=" . s:yellow   . " gui=bold cterm=bold"
execute "highlight pythonException     guifg=" . s:red      . " gui=bold cterm=bold"
execute "highlight pythonExceptions    guifg=" . s:red
execute "highlight pythonRawString     guifg=" . s:green    . " gui=italic cterm=italic"
execute "highlight pythonFString       guifg=" . s:green
execute "highlight pythonStrFormat     guifg=" . s:magenta
execute "highlight pythonSelf          guifg=" . s:br_black . " gui=italic cterm=italic"
execute "highlight pythonDottedName    guifg=" . s:fg

augroup ColoriceThemePython
  autocmd!
  autocmd FileType python syntax keyword pythonSelf self cls containedin=ALL
  execute "autocmd FileType python highlight pythonSelf guifg=" . s:br_black . " gui=italic cterm=italic"
augroup END

" ── Editor UI ─────────────────────────────────────────────────────────────────

execute "highlight LineNr        guifg=" . s:linenr
execute "highlight CursorLineNr  guifg=" . s:white    . " guibg=" . s:bg_light . " gui=bold cterm=bold"
execute "highlight CursorLine                           guibg=" . s:bg_light . " cterm=NONE"
execute "highlight CursorColumn                         guibg=" . s:bg_light
execute "highlight ColorColumn                          guibg=" . s:bg_light
highlight SignColumn guibg=NONE
execute "highlight VertSplit     guifg=" . s:bg_dim
execute "highlight Folded        guifg=" . s:br_black . " guibg=" . s:bg_light . " gui=italic cterm=italic"
execute "highlight FoldColumn    guifg=" . s:linenr

" ── Selection & search ────────────────────────────────────────────────────────

execute "highlight Visual                               guibg=" . s:sel
execute "highlight VisualNOS                            guibg=" . s:sel
execute "highlight Search        guifg=" . s:bg       . " guibg=" . s:yellow   . " gui=bold cterm=bold"
execute "highlight IncSearch     guifg=" . s:bg       . " guibg=" . s:blue     . " gui=bold cterm=bold"
execute "highlight CurSearch     guifg=" . s:bg       . " guibg=" . s:cyan     . " gui=bold cterm=bold"
execute "highlight MatchParen    guifg=" . s:white    . " guibg=" . s:sel      . " gui=bold cterm=bold"

" ── Status line ───────────────────────────────────────────────────────────────

execute "highlight StatusLine    guifg=" . s:fg       . " guibg=" . s:bg_light . " gui=bold cterm=bold"
execute "highlight StatusLineNC  guifg=" . s:comment  . " guibg=" . s:tab_bg

" ── Tabs ──────────────────────────────────────────────────────────────────────

execute "highlight TabLine       guifg=" . s:comment  . " guibg=" . s:tab_bg
execute "highlight TabLineSel    guifg=" . s:fg       . " guibg=" . s:bg_light . " gui=bold cterm=bold"
execute "highlight TabLineFill                          guibg=" . s:tab_bg

" ── Popup menu ────────────────────────────────────────────────────────────────

execute "highlight Pmenu         guifg=" . s:fg       . " guibg=" . s:bg_light
execute "highlight PmenuSel      guifg=" . s:bg       . " guibg=" . s:blue     . " gui=bold cterm=bold"
execute "highlight PmenuSbar                            guibg=" . s:bg_light
execute "highlight PmenuThumb                           guibg=" . s:comment

" ── Diff ──────────────────────────────────────────────────────────────────────

execute "highlight DiffAdd       guifg=" . s:green    . " guibg=" . s:bg_light
execute "highlight DiffDelete    guifg=" . s:red      . " guibg=" . s:bg_light
execute "highlight DiffChange    guifg=" . s:yellow   . " guibg=" . s:bg_light
execute "highlight DiffText      guifg=" . s:fg       . " guibg=" . s:sel      . " gui=bold cterm=bold"

" ── Diagnostics / Spell ───────────────────────────────────────────────────────

execute "highlight SpellBad      guisp=" . s:green    . " gui=undercurl cterm=undercurl"
execute "highlight SpellCap      guisp=" . s:yellow   . " gui=undercurl cterm=undercurl"
execute "highlight SpellRare     guisp=" . s:magenta  . " gui=undercurl cterm=undercurl"
execute "highlight SpellLocal    guisp=" . s:br_mag2  . " gui=undercurl cterm=undercurl"

execute "highlight WarningMsg    guifg=" . s:magenta
execute "highlight ErrorMsg      guifg=" . s:green    . " gui=bold cterm=bold"
execute "highlight MoreMsg       guifg=" . s:blue
execute "highlight Question      guifg=" . s:blue
execute "highlight Directory     guifg=" . s:yellow

" ── Misc ──────────────────────────────────────────────────────────────────────

execute "highlight WildMenu      guifg=" . s:bg       . " guibg=" . s:blue     . " gui=bold cterm=bold"
execute "highlight Conceal       guifg=" . s:comment
execute "highlight SpecialKey    guifg=" . s:bg_dim
