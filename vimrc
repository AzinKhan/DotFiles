"set relativenumber
"set number
set backspace=indent,eol,start
set cursorline
" Set scrolloff so cursor isn't at bottom/top of page
set scrolloff=10
set hlsearch
syntax on
highlight CursorLineNR ctermfg=yellow
highlight CursorLine ctermbg=235 cterm=NONE
highlight ErrorMsg ctermfg=white ctermbg=black guifg=White guibg=Black
highlight LineNr ctermfg=grey
highlight Pmenu ctermfg=30 ctermbg=16
highlight PmenuSel ctermfg=19 ctermbg=231
highlight DiffText ctermfg=None ctermbg=25
highlight DiffChange ctermfg=None ctermbg=35
highlight DiffAdd ctermfg=None ctermbg=30
highlight DiffDelete ctermfg=None ctermbg=160
highlight Search ctermfg=None ctermbg=8
highlight Statement ctermfg=162
highlight Keyword ctermfg=162
nmap ,f :set foldmethod=syntax<CR>
map <C-n> :NERDTreeToggle<CR>
highlight Folded ctermbg=0
highlight Folded ctermfg=14
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

" Jump to last cursor position unless it's invalid or in an event handler
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

""""""""""""""""""""""""""""""""""""""""""""
" Auto-complete brackets, quotations etc
""""""""""""""""""""""""""""""""""""""""""""
ino " ""<left>
ino ' ''<left>
ino ( ()<left>
ino [ []<left>
ino { {}<left>
ino {<CR> {<CR>}<ESC>O
ino {;<CR> {<CR>};<ESC>O

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = {
    \ "mode": "active",
    \ "passive_filetypes": ["tex"],
    \}
let g:syntastic_python_checkers = ['flake8']
"let g:go_highlight_fields = 1
"let g:go_highlight_types = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_version_warning = 0
"let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1

let g:jedi#goto_command = "gd"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = "<leader>d"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MULTIPURPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col
        return "\<tab>"
    endif

    let char = getline('.')[col - 1]
    if char =~ '\k'
        " There's an identifier before the cursor, so complete the identifier.
        return "\<c-space>"
    else
        return "\<tab>"
    endif
endfunction
inoremap <expr> <tab> InsertTabWrapper()
inoremap <s-tab> <c-n>

au BufWrite *.py :Autoformat
let g:formatterpath = ['/Users/azinkhan/.virtualenvs/kraken-core/bin/black', '/Users/azinkhan/.virtualenvs/kraken-core/bin/isort']
let g:formatters_python = ['black', 'isort']

"set updatetime=100
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_max_files=0
"Don't index the git files
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
"set previewheight=40
set shell=/bin/zsh
let Tlist_WinWidth = 30
"let Tlist_Auto_Open = 1
execute pathogen#infect()
vnoremap <silent> # :s/^/#/<cr>:noh<cr>
vnoremap <silent> -# :s/^#//<cr>:noh<cr>
