hi clear

if exists("syntax on")
	syntax reset
endif

set t_Co=256
let g:colors_name = "zenglace"

let s:bg="#021B21"
let s:fg="#e4dbd3"
let s:fg2="#aea589"
let s:fg3="#9f967d"
let s:fg4="#908871"
let s:bg2="#2c464a"
let s:bg3="#40585b"
let s:keyword="#9DE3C0"
let s:builtin="#cfbfad"
let s:const="#85ecd7"
let s:comment="#71c7db"
let s:func="#e1f4ff"
let s:str="#28B5A1"
let s:type="#ade6b3"
let s:var="#e1f4ff"
let s:warning="#ffffff"

exe 'hi Normal guifg='s:fg' guibg='s:bg 
exe 'hi Cursor guifg='s:fg2' guibg='s:fg 
exe 'hi CursorLine guibg='s:bg
exe 'hi CursorColumn guibg='s:bg 
exe 'hi ColorColumn guibg='s:bg 
exe 'hi LineNr guifg='s:fg2' guibg='s:bg 
exe 'hi VertSplit guifg='s:fg3' guibg='s:bg2 
exe 'hi MatchParen guifg='s:bg2' gui=underline'
exe 'hi StatusLine guifg='s:fg2' guibg='s:bg2' gui=bold'
exe 'hi Pmenu guifg='s:fg' guibg='s:bg
exe 'hi PmenuSel guibg='s:bg2 
exe 'hi IncSearch guifg='s:bg2' guibg=s:keyword'
exe 'hi Search guibg='s:bg3' gui=underline'
exe 'hi Directory guifg='s:const
exe 'hi Folded guifg='s:fg4' guibg='s:bg 
exe 'hi Visual guibg='s:bg2

exe 'hi Boolean guifg='s:const  
exe 'hi Character guifg='s:const  
exe 'hi Comment guifg='s:comment  
exe 'hi Conditional guifg='s:keyword  
exe 'hi Constant guifg='s:const  
exe 'hi Define guifg='s:keyword  
exe 'hi DiffAdd guifg=#000000 guibg=#ddffdd gui=bold'
exe 'hi DiffDelete guifg=#ff0000'  
exe 'hi DiffChange guibg='s:bg
exe 'hi DiffText guifg=#000000 guibg=#ddddff gui=bold'
exe 'hi ErrorMsg guifg='s:warning' guibg='s:bg' gui=bold'
exe 'hi WarningMsg guifg='s:fg' guibg='s:bg2 
exe 'hi Float guifg='s:const  
exe 'hi Function guifg='s:func  
exe 'hi Identifier guifg='s:type'  gui=italic'
exe 'hi Keyword guifg='s:keyword'  gui=bold'
exe 'hi Label guifg='s:var
exe 'hi NonText guifg='s:bg3' guibg='s:bg
exe 'hi Number guifg='s:const
exe 'hi Operater guifg='s:keyword  
exe 'hi PreProc guifg='s:keyword
exe 'hi Special guifg='s:fg
exe 'hi SpecialKey guifg='s:fg2' guibg='s:bg 
exe 'hi Statement guifg='s:keyword  
exe 'hi StorageClass guifg='s:type' gui=italic'
exe 'hi String guifg='s:str  
exe 'hi Tag guifg='s:keyword  
exe 'hi Title guifg='s:fg' gui=bold'
exe 'hi Todo guifg='s:fg2' gui=inverse,bold'
exe 'hi Type guifg='s:type 
exe 'hi Underlined gui=underline'

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
