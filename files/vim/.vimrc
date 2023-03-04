" .vimrc by weissenbaeck@posteo.de 2022

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" autowrite
set autowrite


" .............................................................................
" Plug
" .............................................................................

call plug#begin('~/.vim/plugged')
" .............................................................................
" General Vim Plugins
" .............................................................................
Plug 'Asheq/close-buffers.vim'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mhinz/vim-startify'
" Plug 'powerline/powerline'
Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/delimitMate.vim'

" .............................................................................
" (Auto-)Completion
" .............................................................................
Plug 'mattn/emmet-vim'
" Plug 'ycm-core/YouCompleteMe'

" .............................................................................
" Snippets
" .............................................................................
" Plug 'sirver/UltiSnips'
" Plug 'honza/vim-snippets'

" .............................................................................
" HTML CSS JavaScript
" .............................................................................
Plug 'maksimr/vim-jsbeautify'
Plug 'pangloss/vim-javascript'

" .............................................................................
" PHP
" .............................................................................
" Plug 'StanAngeloff/php.vim'
" Plug 'phpactor/phpactor'
" Plug 'stephpy/vim-php-cs-fixer'

" .............................................................................
" Markdown
" .............................................................................
" Plug 'gabrielelana/vim-markdown'
" Plug 'suan/vim-instant-markdown'

" .............................................................................
" Python
" .............................................................................
Plug 'python-mode/python-mode'
" Plug 'davidhalter/jedi-vim'

" .............................................................................
" Vimwiki
" .............................................................................
Plug 'vimwiki/vimwiki'

" .............................................................................
" Plug End
" .............................................................................
call plug#end()


" .............................................................................
" Better copy & paste
" When you want to paste large blocks of code into vim, press F2 before you
" paste. At the bottom you should see ``-- INSERT (paste) --``.
" .............................................................................
set pastetoggle=<F2>
set clipboard=unnamed


" .............................................................................
" Mouse and backspace
" .............................................................................
set mouse=a  " on OSX press ALT and click
set bs=2     " make backspace behave like normal again


" .............................................................................
" Rebind <Leader> key
" I like to have it here becuase it is easier to reach than the default and
" it is next to ``m`` and ``n`` which I use for navigating between tabs.
" .............................................................................
let mapleader = ","


" .............................................................................
" Bind nohl
" Removes highlight of your last search
" ``<C>`` stands for ``CTRL`` and therefore ``<C-x>`` stands for ``CTRL+x``
" .............................................................................
noremap <C-x> :nohl<CR>
vnoremap <C-x> :nohl<CR>
inoremap <C-x> :nohl<CR>


" .............................................................................
" Quicksave command
" .............................................................................
noremap <C-Z> :update<CR>
vnoremap <C-Z> <C-C>:update<CR>
inoremap <C-Z> <C-O>:update<CR>


" .............................................................................
" Quick quit command
" .............................................................................
noremap <Leader>e :quit<CR>  " Quit current window
noremap <Leader>E :qa!<CR>   " Quit all windows
noremap <Leader>q <esc><c-w>j<esc>:q<CR>


" .............................................................................
" Bind Ctrl+<movement> keys to move around the windows, instead of using
" Ctrl+w + <movement>
" Every unnecessary keystroke that can be saved is good for your health :)
" .............................................................................
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h


" .............................................................................
" Easier moving between tabs
" .............................................................................
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>
map <Leader>N <esc>:tabnew<CR>


" .............................................................................
" Map sort function to a key
" .............................................................................
vnoremap <Leader>s :sort<CR>


" .............................................................................
" Easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
" .............................................................................
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation


" .............................................................................
" Show whitespace
" MUST be inserted BEFORE the colorscheme command
" .............................................................................
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/


" .............................................................................
" Color scheme
" mkdir -p ~/.vim/colors && cd ~/.vim/colors
" wget -O wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400
" .............................................................................
set t_Co=256 " Explicitly tell Vim that the terminal supports 256 colors
" color wombat256mod
" color molokai
color predawn


" .............................................................................
" Enable syntax highlighting
" You need to reload this file for the change to apply
" .............................................................................
filetype off
filetype plugin indent on
syntax on


" .............................................................................
" Folding
" .............................................................................
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview
set foldmethod=indent
set nofoldenable


" .............................................................................
" Showing line numbers and length
" .............................................................................
set number  " show line numbers
set relativenumber " show relative numbers in present line
set tw=79   " width of document (used by gd)
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing
set fo+=t   " automatically wrap text when typing
set colorcolumn=80
highlight ColorColumn ctermbg=233


" .............................................................................
" Transparent background
" .............................................................................
" hi NonText ctermbg=none 
" hi Normal guibg=NONE ctermbg=NONE


" .............................................................................
" Easier formatting of paragraphs
" .............................................................................
vmap Q gq
nmap Q gqap


" .............................................................................
" Useful settings
" .............................................................................
set history=700
set undolevels=700


" .............................................................................
" Real programmers don't use TABs but spaces
" .............................................................................
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab


" .............................................................................
" Make search case insensitive
" .............................................................................
set hlsearch
set incsearch
set ignorecase
set smartcase


" .............................................................................
" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
" .............................................................................
set nobackup
set nowritebackup
set noswapfile


" .............................................................................
" Remember last position in file
" .............................................................................
if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
                \| exe "normal! g'\"" | endif
endif



" .............................................................................
" Erweiterter Modus der Kommandozeilen-Vervollständigung mit Tab, in dem 
" alle Treffer in einem Menü angezeigt werden
" .............................................................................
set wmnu


" .............................................................................
" Toggle spellchecking
" .............................................................................
function! ToggleSpellCheck()
    set spell!
    if &spell
        echo "Spellcheck ON"
    else
        echo "Spellcheck OFF"
    endif
endfunction

nnoremap <Leader>S :call ToggleSpellCheck()<CR>

nnoremap <Leader>D :set spelllang=de<CR>
nnoremap <Leader>E :set spelllang=en_gb<CR>


" .............................................................................
" You can add some shortcuts to make it easier to jump between 
" errors in quickfix list:
" .............................................................................
map <C-1> :cnext<CR>
map <C-2> :cprevious<CR>
" nnoremap <leader>q :cclose<CR>


" .............................................................................
" Running a macro
" .............................................................................
nnoremap <Space> @q


" .............................................................................
" Help text window on the right pane
" .............................................................................
autocmd FileType help wincmd L


" .............................................................................
" Vsplit to the right panel | Split below
" .............................................................................
:set splitright
:set splitbelow


" .............................................................................
" Mouse and backspace
" .............................................................................
set mouse=a  " on OSX press ALT and click
set bs=2     " make backspace behave like normal again


" .............................................................................
" Better navigating through omnicomplete option list
" See http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
" .............................................................................
" set completeopt=longest,menuone
" function! OmniPopup(action)
    " if pumvisible()
        " if a:action == 'j'
            " return "\<C-N>"
        " elseif a:action == 'k'
            " return "\<C-P>"
        " endif
    " endif
    " return a:action
" endfunction

" inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
" inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>


" .............................................................................
" NERDTree
" .............................................................................
" let g:NERDTreeDirArrowExpandable="+"
" let g:NERDTreeDirArrowCollapsible="~"
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
map <C-t> :NERDTreeToggle<CR>


" .............................................................................
" YouCompleteMe
" .............................................................................
nnoremap <silent> <Leader>gd :YcmCompleter GoToDefinition<CR>
nnoremap <silent> <Leader>gf :YcmCompleter FixIt<CR>
" let g:ycm_key_list_select_completion = ['<Down>']
" let g:ycm_key_list_select_completion = ['<TAB>', '<Down>']
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>


" .............................................................................
" Ultimate Snippets
" .............................................................................
" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
" let g:UltiSnipsExpandTrigger='<tab>'
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"


" .............................................................................
" NERDCOMMENTER
" add space after comment
" .............................................................................
let g:NERDSpaceDelims = 2


" .............................................................................
" Close-Buffers Shortcut to delete hidden buffers
" .............................................................................
map <Leader>bh <esc>:Bdelete hidden<CR>


" .............................................................................
" Vim-powerline
" .............................................................................
" set nocompatible   " Disable vi-compatibility
" set laststatus=2   " Always show the statusline
" set encoding=utf-8 " Necessary to show Unicode glyphs

" let g:Powerline_symbols = 'fancy'
" let g:Powerline_stl_path_style = 'full'
" let g:Powerline_colorscheme = 'solarized256'


" .............................................................................
" Vim airline themes
" .............................................................................
let g:airline_powerline_fonts = 1
let g:airline_theme='atomic'


" .............................................................................
" Settings for ctrlp
" cd ~/.vim/bundle
" git clone https://github.com/kien/ctrlp.vim.git
" .............................................................................
let g:ctrlp_max_height = 30
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let g:ctrlp_show_hidden=1
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*.venv/*
set wildignore+=*/coverage/*


" .............................................................................
" Vimwiki settings
" .............................................................................
let g:vimwiki_list = [{'path': '~/Dokumente/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.mkd': 'markdown', '.wiki': 'media'}


" .............................................................................
" Instant markdown settings
" .............................................................................
" let g:instant_markdown_autostart = 0
" map <leader>md :InstantMarkdownPreview<CR>


" ============================================================================
" Python IDE Setup
" ============================================================================

" .............................................................................
" Python-mode-settings
" .............................................................................
let g:pymode_options = 1
let g:pymode_syntax = 1
let g:pymode_options_colorcolumn = 1
let g:pymode_quickfix_minheight = 3
let g:pymode_quickfix_maxheight = 6
" let g:pymode_syntax_builtin_objs = 0
" let g:pymode_syntax_builtin_funcs = 0

" .............................................................................
" Pymode-mappings
" .............................................................................
map <Leader>p <esc>:PymodeRun<CR>
map <Leader>l <esc>:PymodeLintAuto<CR>
" map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>
" map <Leader>g :call RopeGotoDefinition()<CR>

" .............................................................................
" Python-mode Rope settings
" .............................................................................
let g:pymode_rope = 1
let g:pymode_rope_goto_def_newwin = "vnew"
let g:pymode_rope_autoimport = 1
let g:pymode_rope_ropefolder='.rope'
" let ropevim_enable_shortcuts = 1


" ============================================================================
" WEBDEV IDE Setup
" ============================================================================

" .............................................................................
" Javascript Folding
" .............................................................................
augroup javascript_folding
    au!
    au FileType javascript setlocal foldmethod=syntax
augroup END


" .............................................................................
" BEAUTIFY JS JSON JSX HTML CSS
" .............................................................................
autocmd FileType javascript noremap <buffer><c-b> :call JsBeautify()<cr>
autocmd FileType javascript vnoremap <buffer><c-B> :call RangeJsBeautify()<cr>

" for json
autocmd FileType json noremap <buffer><c-b> :call JsonBeautify()<cr>
autocmd FileType json vnoremap <buffer><c-B> :call RangeJsonBeautify()<cr>

" for jsx
autocmd FileType jsx noremap <buffer><c-b> :call JsxBeautify()<cr>
autocmd FileType jsx vnoremap <buffer><c-B> :call RangeJsxBeautify()<cr>

" for html
autocmd FileType html noremap <buffer><c-b> :call HtmlBeautify()<cr>
autocmd FileType html vnoremap <buffer> <c-B> :call RangeHtmlBeautify()<cr>

" for css or scss
autocmd FileType css noremap <buffer><c-b> :call CSSBeautify()<cr>
autocmd FileType css vnoremap <buffer><c-B> :call RangeCSSBeautify()<cr>


" .............................................................................
" SHORTCUT TO CALL PHP-CS-FIXER
" .............................................................................
" nmap <silent> <Leader>P :call PhpCsFixerFixFile()<CR>
" let g:php_cs_fixer_phar_path = '/home/gw/.config/composer/vendor/bin/php-cs-fixer'
" let g:php_cs_fixer_rules = "@PSR2"

" autocmd FileType php setlocal omnifunc=phpactor#Complete
