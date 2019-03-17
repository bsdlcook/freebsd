hi clear

if exists("syntax on")
	syntax reset
endif

set t_Co=256
let g:colors_name = "redrose"

let s:bg="#242529"
let s:fg="#efefef"
let s:fg2="#dcdcdc"
let s:fg3="#c9c9c9"
let s:fg4="#b6b6b6"
let s:bg3="#464646"
let s:bg4="#585858"
let s:keyword="#a65959"
let s:builtin="#c56666"
let s:const= "#ebb5b5"
let s:comment="#8f353a"
let s:func="#e29494"
let s:str="#a69696"
let s:type="#772d3b"
let s:var="#c11737"
let s:warning="#ff0000"
let s:warning2="#ac5043"

exe 'hi Normal guifg='s:fg' guibg='s:bg 
exe 'hi Cursor guifg='s:bg' guibg='s:bg 
exe 'hi CursorLine  guibg='s:bg
exe 'hi CursorColumn  guibg='s:bg 
exe 'hi ColorColumn  guibg='s:bg 
exe 'hi LineNr guifg='s:fg2' guibg='s:bg 
exe 'hi VertSplit guifg='s:fg3' guibg='s:bg 
exe 'hi MatchParen guifg='s:builtin'  gui=underline'
exe 'hi StatusLine guifg='s:fg2' guibg='s:bg' gui=bold'
exe 'hi Pmenu guifg='s:fg' guibg='s:bg
exe 'hi PmenuSel  guibg='s:bg 
exe 'hi IncSearch guifg='s:bg3' guibg='s:keyword 
exe 'hi Search guibg='s:fg4' gui=underline'
exe 'hi Directory guifg='s:const  
exe 'hi Folded guifg='s:fg4' guibg='s:bg 
exe 'hi Visual guibg='s:bg3

exe 'hi Boolean guifg='s:const  
exe 'hi Character guifg='s:const  
exe 'hi Comment guifg='s:comment  
exe 'hi Conditional guifg='s:keyword  
exe 'hi Constant guifg='s:const  
exe 'hi Define guifg='s:keyword  
exe 'hi DiffAdd guifg=#000000 guibg=#ddffdd gui=bold'
exe 'hi DiffDelete guifg=#ff0000'  
exe 'hi DiffChange  guibg='s:bg
exe 'hi DiffText guifg=#000000 guibg=#ddddff gui=bold'
exe 'hi ErrorMsg guifg='s:warning' guibg='s:bg' gui=bold'
exe 'hi WarningMsg guifg='s:fg' guibg='s:warning2 
exe 'hi Float guifg='s:const  
exe 'hi Function guifg='s:func  
exe 'hi Identifier guifg='s:type'  gui=italic'
exe 'hi Keyword guifg='s:keyword'  gui=bold'
exe 'hi Label guifg='s:var
exe 'hi NonText guifg='s:bg4' guibg='s:bg 
exe 'hi Number guifg='s:const  
exe 'hi Operater guifg='s:keyword  
exe 'hi PreProc guifg='s:keyword  
exe 'hi Special guifg='s:fg  
exe 'hi SpecialKey guifg='s:fg2' guibg='s:bg
exe 'hi Statement guifg='s:keyword  
exe 'hi StorageClass guifg='s:type'  gui=italic'
exe 'hi String guifg='s:str  
exe 'hi Tag guifg='s:keyword  
exe 'hi Title guifg='s:fg'  gui=bold'
exe 'hi Todo guifg='s:fg2'  gui=inverse,bold'
exe 'hi Type guifg='s:type 
exe 'hi Underlined   gui=underline'

exe 'hi rubyAttribute guifg='s:builtin
exe 'hi rubyLocalVariableOrMethod guifg='s:var
exe 'hi rubyGlobalVariable guifg='s:var' gui=italic'
exe 'hi rubyInstanceVariable guifg='s:var
exe 'hi rubyKeyword guifg='s:keyword
exe 'hi rubyKeywordAsMethod guifg='s:keyword' gui=bold'
exe 'hi rubyClassDeclaration guifg='s:keyword' gui=bold'
exe 'hi rubyClass guifg='s:keyword' gui=bold'
exe 'hi rubyNumber guifg='s:const

exe 'hi pythonBuiltinFunc guifg='s:builtin
exe 'hi goBuiltins guifg='s:builtin
exe 'hi jsBuiltins guifg='s:builtin
exe 'hi jsFunction guifg='s:keyword' gui=bold'
exe 'hi jsGlobalObjects guifg='s:type
exe 'hi jsAssignmentExps guifg='s:var
exe 'hi htmlLink guifg='s:var' gui=underline'
exe 'hi htmlStatement guifg='s:keyword
exe 'hi htmlSpecialTagName guifg='s:keyword
exe 'hi mkdCode guifg='s:builtin
