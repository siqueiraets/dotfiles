set nocompatible        " Must be first line
set shell=/bin/zsh

" Adjust tmux navigator bindings
let g:tmux_navigator_no_mappings = 1
let g:tmux_navigator_disable_when_zoomed = 1
nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>

if filereadable(expand("~/.vim/.vimrc.bundles"))
source ~/.vim/.vimrc.bundles
endif

set background=dark         " Assume a dark background

syntax on                   " Enable syntax highlighting
set mouse=a                 " Enable mouse usage
set mousehide               " Hide the mouse cursor while typing
scriptencoding utf-8        " Force a default encoding

" Enable clipboard as default register when available
if has('clipboard')
if has('unnamedplus')
    set clipboard=unnamed,unnamedplus
else
    set clipboard=unnamed
endif
endif

set history=1000             " Increase the history size
set shortmess+=filmnrxoOtT   " Abbrev. of messages (avoids 'hit enter')

set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
set virtualedit=block
set spell                    " Spell checking on
set hidden                   " Allow buffer switching without saving
set iskeyword-=.             " '.' is an end of word designator
set iskeyword-=#             " '#' is an end of word designator
set iskeyword-=-             " '-' is an end of word designator

set backup                  " Backups are nice ...
set undofile                " So is persistent undo ...
set undolevels=1000         " Maximum number of changes that can be undone
set undoreload=10000        " Maximum number lines to save for undo on a buffer reload
set backupdir=~/.vimbackup,/var/tmp,/tmp
set directory=~/.vimbackup,/var/tmp,/tmp
set backupskip=/var/tmp,/tmp
if has('persistent_undo')
    set undodir=~/.vimundo  " Remap the undo file directory
endif

" Colorscheme definitions
let g:solarized_termcolors=256
let g:solarized_termtrans=1
let g:solarized_contrast="normal"
let g:solarized_visibility="normal"
" color solarized
"
"colorscheme solarized
colorscheme peaksea

set tabpagemax=15           " Only show 15 tabs
set showmode                " Display the current mode

" set cursorline              " Highlight current line
set ruler                   " Show the ruler
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
set showcmd                 " Show partial commands in status line and
                            " Selected characters/lines in visual mode

set laststatus=2

" Broken down into easily includeable segments
set statusline=%<%f\                     " Filename
set statusline+=%w%h%m%r                 " Options
set statusline+=%{fugitive#statusline()} " Git Hotness
set statusline+=\ [%{&ff}/%Y]            " Filetype
set statusline+=\ [%{getcwd()}]          " Current dir
set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info

set laststatus=2

" Broken down into easily includeable segments
set statusline=%<%f\                     " Filename
set statusline+=%w%h%m%r                 " Options
set statusline+=%{fugitive#statusline()} " Git Hotness
set statusline+=\ [%{&ff}/%Y]            " Filetype
set statusline+=\ [%{getcwd()}]          " Current dir
set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info

set number                      " Line numbers on
set relativenumber              " Enable relative numbers
set showmatch                   " Show matching brackets/parenthesis
set incsearch                   " Find as you type search
set hlsearch                    " Highlight search terms
set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive when uc present
set wildmenu                    " Show list instead of just completing
set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
set scrolloff=3                 " Minimum lines to keep above and below cursor
set foldenable                  " Auto fold code
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight whitespaces and tabs

set nowrap                      " Do not wrap long lines
set autoindent                  " Indent at the same level of the previous line
set shiftwidth=4                " Use indents of 4 spaces
set expandtab                   " Tabs are spaces, not tabs
set tabstop=4                   " An indentation every four columns
set softtabstop=4               " Let backspace delete indent
set splitright                  " Puts new vsplit windows to the right of the current
set splitbelow                  " Puts new split windows to the bottom of the current


let mapleader = ','

" Wrapped lines goes down/up to next row, rather than next line in file.
noremap j gj
noremap k gk

" Easily move between tabs
map <S-H> gT
map <S-L> gt

" Code folding options
nmap <leader>f0 :set foldlevel=0<CR>
nmap <leader>f1 :set foldlevel=1<CR>
nmap <leader>f2 :set foldlevel=2<CR>
nmap <leader>f3 :set foldlevel=3<CR>
nmap <leader>f4 :set foldlevel=4<CR>
nmap <leader>f5 :set foldlevel=5<CR>
nmap <leader>f6 :set foldlevel=6<CR>
nmap <leader>f7 :set foldlevel=7<CR>
nmap <leader>f8 :set foldlevel=8<CR>
nmap <leader>f9 :set foldlevel=9<CR>

" Highlight search toggle
nmap <silent> <leader>/ :set invhlsearch<CR>

" Visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" Allow using the repeat operator with a visual selection (!)
" http://stackoverflow.com/a/8064607/127816
vnoremap . :normal .<CR>

" Easier horizontal scrolling
" Move screen to right and left
map zl zL
map zh zH

nnoremap <C-e> :NERDTreeToggle<CR>
nnoremap <leader>d :NERDTreeFind<CR>
let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']

let g:pymode = 0
let g:pymode_lint_checkers = ['pyflakes']

" Add mapping to open/close tagbar
nnoremap <silent> <leader>tt :TagbarToggle<CR>
nnoremap <leader>tc :TagbarCurrentTag<CR>

" Fugitive mappings
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gl :Glog<CR>
nnoremap <silent> <leader>gp :Git push<CR>
nnoremap <silent> <leader>gr :Gread<CR>
nnoremap <silent> <leader>gw :Gwrite<CR>
nnoremap <silent> <leader>ge :Gedit<CR>
nnoremap <silent> <leader>gi :Git add -p %<CR>
nnoremap <silent> <leader>gg :SignifyToggle<CR>

" Undotree
nnoremap <Leader>u :UndotreeToggle<CR>
" If undotree is opened, it is likely one wants to interact with it.
let g:undotree_SetFocusWhenToggle=1

" indent_guides
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1

" Load cscope mappings (Download from http://cscope.sourceforge.net/cscope_maps.vim)
if filereadable(expand("~/.vim/cscope_maps.vim"))
    source ~/.vim/cscope_maps.vim
endif

" Pt-br keyboard adaptation
noremap ç :

" YouCompleteMe
let g:ycm_global_ycm_extra_conf = "~/.ycm_extra_conf.py"
let g:ycm_confirm_extra_conf = 0

" ClangFormat
map <leader>f :py3f /usr/share/vim/addons/syntax/clang-format.py<cr>
map <leader>F :%py3f /usr/share/vim/addons/syntax/clang-format.py<cr>

" ClangFormat
"function ExecuteClangAutoFormat()
    "%py3f /usr/share/vim/addons/syntax/clang-format.py
"endfunction
"nmap <leader>z :call ExecuteClangAutoFormat()<cr>

" Easy buffer navigation using TAB
nmap <Tab> :bn<cr>
nmap <S-Tab> :bp<cr>

" Disable annoying ex command and change it into what
" is the most frequent mistake when pressing Q
nmap Q :bp<cr>

" Map shortcuts to 'maximize/minimize' screen
"nmap <leader>ff :res<cr> :vertical res<cr>
"nmap <leader>fe :winc =<cr>

if has('nvim')
    let g:deoplete#enable_at_startup = 1
endif

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/'

let g:LanguageClient_serverCommands = {
    \ 'cpp': ['clangd-8']
    \ }

" Language client with background index
"let g:LanguageClient_serverCommands = {
    "\ 'cpp': ['clangd-8', '-background-index']
    "\ }

imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
"
" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif


if has('nvim')
tnoremap <ESC> <C-\><C-n>
tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
endi

" Fzf
nmap <leader>o :Files<cr>
nmap <leader>b :Buffers<cr>
nmap <C-p> :Files<cr>
nmap <F3> :Ag <C-R><C-W><cr>

" LanguageClient
nmap <F2> :call LanguageClient#textDocument_rename()<cr>
nmap <F4> :call LanguageClient#textDocument_definition()<cr>

" Bufferline
let g:bufferline_active_buffer_left = '['
let g:bufferline_active_buffer_right = ']'

" BufOnly
if filereadable(expand("~/.vim/BufOnly.vim"))
    source ~/.vim/BufOnly.vim
    nmap <C-Q> :BufOnly <cr>
endif

let g:BufKillCreateMappings = 0
map <leader>x :BD<cr>

map <leader>t :TlistToggle<cr>

" Paste without overwrite
vnoremap <leader>p "_dP

" Toggle between header and source files
function! HeaderToggle()
let file_path = expand("%")
let file_name = expand("%<")
let extension = split(file_path, '\.')[-1]

if extension == "cpp" || extension == "c"
    let next_file = substitute(join([file_name, ".h"], ""), "src/", "include/", "")
    let next_file2 = substitute(join([file_name, ".h"], ""), "src/", "inc/", "")
    let next_file3 = join([file_name, ".h"], "")

    if filereadable(next_file)
        :execute 'edit ' next_file
    elseif filereadable(next_file2)
        :execute 'edit ' next_file2
    elseif filereadable(next_file3)
        :execute 'edit ' next_file3
    endif
elseif extension == "h"
    let next_file = join([file_name, ".cpp"], "")
    let next_file2 = join([file_name, ".c"], "")
    let next_file3 = substitute(join([file_name, ".cpp"], ""), "include/", "src/", "")
    let next_file4 = substitute(join([file_name, ".c"], ""), "include/", "src/", "")
    let next_file5 = substitute(join([file_name, ".cpp"], ""), "inc/", "src/", "")
    let next_file6 = substitute(join([file_name, ".c"], ""), "inc/", "src/", "")

    if filereadable(next_file)
        :execute 'edit ' next_file
    elseif filereadable(next_file2)
        :execute 'edit ' next_file2
    elseif filereadable(next_file3)
        :execute 'edit ' next_file3
    elseif filereadable(next_file4)
        :execute 'edit ' next_file4
    elseif filereadable(next_file5)
        :execute 'edit ' next_file5
    elseif filereadable(next_file6)
        :execute 'edit ' next_file6
    endif
endif
endfunction

nmap <F6> :call HeaderToggle()<cr>

" airline customizations
let g:airline_section_b = ""
let g:airline_section_x = ""
let g:airline_section_y = ""
let g:airline_theme="solarized"


map ; :
noremap ;; ;
