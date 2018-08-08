set t_Co=256 "enable 256 color in vim
set guioptions-=T  "remove toolbar 
"Shortcut for buffer switching

let g:newrw_liststyle=3
set incsearch
set ignorecase
set hlsearch
"set g assumed by default
set gdefault

"put preview window on right
set splitbelow

set number			"show line number
set relativenumber	"show relative number, thus easier to jump quickly
"tab width
set tabstop=2    	"size of a hard tabstop
set shiftwidth=2 	"size of an indent
set softtabstop=2	"combination of spaces and tabs are used otherwise
set expandtab
" smart indentation
set autoindent

" Shortcut for folding
set foldmethod=manual
nnoremap <space> za

" Shortcut for tabs 
noremap <A-j> gT
noremap <A-k> gt
ca tn tabnew
ca tm tabm
" To save, ctrl-s
nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>a

if has("gui_running")
	colorscheme desert
else
	colorscheme darkblue
endif

" Fix alt mapping doesn't work in gnome-terminal
let c='a'
while c <= 'z'
  exec "set <A-".c.">=\e".c
  exec "imap \e".c." <A-".c.">"
  let c = nr2char(1+char2nr(c))
endw

set timeout ttimeoutlen=50

" pathogen plugin manager
execute pathogen#infect()
syntax on
filetype plugin indent on

"airline configuration
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_min_count = 2
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_buffers = 0
set guifont=Liberation\ Mono\ for\ Powerline\ 10 
let g:airline_powerline_fonts = 1
set laststatus=2
let g:airline_theme='wombat'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
"nerdcommenter configuration
filetype plugin on

"map leader
let mapleader = ","

"syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

" ctrlP
let g:ctrlp_by_filename = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<2-LeftMouse>'],
    \ 'AcceptSelection("t")': ['<cr>'],
    \ }
let g:ctrlp_show_hidden = 1

"CursorLine
hi CursorLine cterm=NONE ctermbg=149 ctermfg=235 guibg=#AFD75F guifg=#262626
"transparent background
hi Normal ctermbg=none

"Splitter
hi VertSplit ctermbg=NONE ctermfg=149 guifg=#AFD75F guibg=NONE cterm=BOLD gui=BOLD
set fillchars=vert:┃
"LineNr
hi LineNr ctermbg=235 guibg=#262626

"vimshell 
let g:vimshell_enable_smart_case   = 1
let g:vimshell_prompt              = '➤  '
let g:vimshell_user_prompt         = 'fnamemodify(getcwd(), ":~")'
let g:vimshell_right_prompt        = 'system("date")'
let g:vimshell_temporary_directory = "~/tmp/vimshell"

"youcompleteme
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_path_to_python_interpreter = '/usr/bin/python3'

"neoComplete
let g:neocomplete#enable_at_startup = 1
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
