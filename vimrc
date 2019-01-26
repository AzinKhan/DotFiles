set relativenumber
set cursorline
highlight Keyword ctermfg=162
highlight CursorLineNR ctermfg=yellow
highlight CursorLine ctermbg=black cterm=NONE
highlight ErrorMsg ctermfg=white ctermbg=black guifg=White guibg=Black
highlight LineNr ctermfg=grey
highlight Pmenu ctermfg=30 ctermbg=16
highlight PmenuSel ctermfg=19 ctermbg=231
highlight DiffText ctermfg=None ctermbg=25
highlight DiffChange ctermfg=None ctermbg=35
highlight DiffAdd ctermfg=None ctermbg=30
highlight DiffDelete ctermfg=None ctermbg=160
highlight Search ctermfg=None ctermbg=8
nmap ,f :set foldmethod=syntax<CR>
map <C-n> :NERDTreeToggle<CR>
highlight Folded ctermbg=0
highlight Folded ctermfg=14
syntax on
set t_Co:256
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
" air-line
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
ino " ""<left>
ino ' ''<left>
ino ( ()<left>
ino [ []<left>
ino { {}<left>
ino {<CR> {<CR>}<ESC>O
ino {;<CR> {<CR>};<ESC>O

augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = {
    \ "mode": "active",
    \ "passive_filetypes": ["tex"],
    \}
"let g:syntastic_python_checkers = ['flake8']
"let g:go_highlight_fields = 1
""let g:go_highlight_types = 1
let g:go_highlight_functions = 1 
"let g:go_highlight_methods = 1
"let g:go_highlight_operators = 1
"let g:go_highlight_extra_types = 1
let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1
"let g:go_auto_sameids = 1
set updatetime=50
execute pathogen#infect()
