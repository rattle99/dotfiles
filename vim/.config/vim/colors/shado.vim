set background=dark
highlight clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "shado"

" ── Background & foreground ───────────────────────────────────────────────────

hi Normal       guifg=#e3c7fc guibg=#191724
hi NonText      guifg=#2a2036 guibg=NONE
hi EndOfBuffer  guifg=#2a2036 guibg=NONE

" ── Core syntax ───────────────────────────────────────────────────────────────

hi Comment      guifg=#6e5a7a gui=italic cterm=italic
hi Constant     guifg=#E9729D
hi String       guifg=#FF4971
hi Character    guifg=#FF4971
hi Number       guifg=#E9729D
hi Float        guifg=#E9729D
hi Boolean      guifg=#E9729D gui=italic cterm=italic

hi Identifier   guifg=#e3c7fc
hi Function     guifg=#F18FB0 gui=bold cterm=bold

hi Statement    guifg=#bd93f9 gui=bold cterm=bold
hi Keyword      guifg=#bd93f9 gui=bold cterm=bold
hi Conditional  guifg=#bd93f9
hi Repeat       guifg=#bd93f9
hi Label        guifg=#bd93f9
hi Exception    guifg=#B52A5B gui=bold cterm=bold
hi Operator     guifg=#f1c4e0

hi PreProc      guifg=#B52A5B
hi Include      guifg=#B52A5B gui=italic cterm=italic
hi Define       guifg=#B52A5B
hi Macro        guifg=#B52A5B

hi Type         guifg=#8897F4
hi StorageClass guifg=#8897F4 gui=italic cterm=italic
hi Structure    guifg=#8897F4 gui=bold cterm=bold
hi Typedef      guifg=#8897F4

hi Special      guifg=#f1c4e0
hi SpecialChar  guifg=#E9729D gui=bold cterm=bold
hi Delimiter    guifg=#7e6b8a
hi SpecialComment guifg=#bd93f9 gui=italic cterm=italic
hi Tag          guifg=#F18FB0

hi Underlined   guifg=#bd93f9 gui=underline cterm=underline
hi Error        guifg=#FF4971 guibg=NONE gui=undercurl cterm=undercurl
hi Todo         guifg=#191724 guibg=#8897F4 gui=bold cterm=bold

hi Title        guifg=#F18FB0 gui=bold cterm=bold
hi Bold         gui=bold cterm=bold
hi Italic       gui=italic cterm=italic

" ── Python-specific ───────────────────────────────────────────────────────────

hi pythonBuiltin      guifg=#c4a7e7
hi pythonBuiltinFunc  guifg=#c4a7e7
hi pythonBuiltinObj   guifg=#c4a7e7 gui=italic cterm=italic
hi pythonDecorator    guifg=#E9729D gui=bold cterm=bold
hi pythonDecoratorName guifg=#E9729D
hi pythonFunction     guifg=#F18FB0 gui=bold cterm=bold
hi pythonClass        guifg=#8897F4 gui=bold cterm=bold
hi pythonException    guifg=#B52A5B gui=bold cterm=bold
hi pythonExceptions   guifg=#B52A5B
hi pythonRawString    guifg=#FF4971 gui=italic cterm=italic
hi pythonFString      guifg=#FF4971
hi pythonStrFormat    guifg=#E9729D
hi pythonSelf         guifg=#a8899c gui=italic cterm=italic
hi pythonDottedName   guifg=#e3c7fc

" Match 'self' as a keyword-ish highlight in Python
augroup ShadoThemePython
  autocmd!
  autocmd FileType python syntax keyword pythonSelf self cls containedin=ALL
  autocmd FileType python hi pythonSelf guifg=#a8899c gui=italic cterm=italic
augroup END

" ── Editor UI ─────────────────────────────────────────────────────────────────

hi LineNr       guifg=#4a3c56 guibg=NONE
hi CursorLineNr guifg=#f1c4e0 guibg=#1e1530 gui=bold cterm=bold
hi CursorLine   guibg=#1e1530 guifg=NONE cterm=NONE
hi CursorColumn guibg=#1e1530
hi ColorColumn  guibg=#1e1530
hi SignColumn   guibg=NONE
hi VertSplit    guifg=#2a2036 guibg=NONE
hi Folded       guifg=#a8899c guibg=#1e1530 gui=italic cterm=italic
hi FoldColumn   guifg=#4a3c56 guibg=NONE

" ── Selection & search ────────────────────────────────────────────────────────

hi Visual       guibg=#352b45
hi VisualNOS    guibg=#352b45
hi Search       guibg=#8897F4 guifg=#191724 gui=bold cterm=bold
hi IncSearch    guibg=#bd93f9 guifg=#191724 gui=bold cterm=bold
hi CurSearch    guibg=#F18FB0 guifg=#191724 gui=bold cterm=bold

" ── Matching ──────────────────────────────────────────────────────────────────

hi MatchParen   guifg=#f1c4e0 guibg=#352b45 gui=bold cterm=bold

" ── Status line ───────────────────────────────────────────────────────────────

hi StatusLine   guifg=#e3c7fc guibg=#1e1530 gui=bold cterm=bold
hi StatusLineNC guifg=#6e5a7a guibg=#09090d

" ── Tabs ──────────────────────────────────────────────────────────────────────

hi TabLine      guifg=#6e5a7a guibg=#09090d
hi TabLineSel   guifg=#e3c7fc guibg=#1e1530 gui=bold cterm=bold
hi TabLineFill  guibg=#09090d

" ── Popup menu ────────────────────────────────────────────────────────────────

hi Pmenu        guifg=#e3c7fc guibg=#1e1530
hi PmenuSel     guifg=#191724 guibg=#bd93f9 gui=bold cterm=bold
hi PmenuSbar    guibg=#1e1530
hi PmenuThumb   guibg=#6e5a7a

" ── Diff ──────────────────────────────────────────────────────────────────────

hi DiffAdd      guifg=#FF4971 guibg=#1e1530
hi DiffDelete   guifg=#B52A5B guibg=#1e1530
hi DiffChange   guifg=#8897F4 guibg=#1e1530
hi DiffText     guifg=#e3c7fc guibg=#352b45 gui=bold cterm=bold

" ── Diagnostics / Spell ───────────────────────────────────────────────────────

hi SpellBad     guisp=#FF4971 gui=undercurl cterm=undercurl
hi SpellCap     guisp=#8897F4 gui=undercurl cterm=undercurl
hi SpellRare    guisp=#E9729D gui=undercurl cterm=undercurl
hi SpellLocal   guisp=#c4a7e7 gui=undercurl cterm=undercurl
hi WarningMsg   guifg=#E9729D
hi ErrorMsg     guifg=#FF4971 guibg=NONE gui=bold cterm=bold
hi MoreMsg      guifg=#bd93f9
hi Question     guifg=#bd93f9
hi Directory    guifg=#8897F4

" ── Misc ──────────────────────────────────────────────────────────────────────

hi WildMenu     guifg=#191724 guibg=#bd93f9 gui=bold cterm=bold
hi Conceal      guifg=#6e5a7a guibg=NONE
hi SpecialKey   guifg=#2a2036
