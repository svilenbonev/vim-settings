call plug#begin('~/.config/nvim/plugged')

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-git'
Plug 'junegunn/gv.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'justinmk/vim-dirvish'
Plug 'justinmk/vim-sneak'
Plug 'valloric/youcompleteme', { 'do': './install.py --clang-completer' }
Plug 'mileszs/ack.vim'
Plug 'w0rp/ale'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'majutsushi/tagbar'
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
Plug 'wellle/targets.vim'
Plug 'airblade/vim-gitgutter'
Plug 'editorconfig/editorconfig-vim'
Plug 'morhetz/gruvbox'
Plug 'chiel92/vim-autoformat'
Plug 'sheerun/vim-polyglot'
Plug 'ntpeters/vim-better-whitespace'
Plug 'yggdroot/indentline'
Plug 'ap/vim-css-color'

call plug#end()

syntax enable

if (has("termguicolors"))
    set termguicolors
endif

colorscheme gruvbox
let g:gruvbox_improved_warnings=1
let g:gruvbox_guisp_fallback='bg'

set background=dark
set hidden
set incsearch ignorecase smartcase
set number relativenumber
set nowrap
set backupcopy=yes
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite,*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
set completeopt=longest,menuone

let g:airline_theme='gruvbox'
let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 1
let g:airline#extensions#branch#enabled = 0
let g:airline#extensions#hunks#enabled = 0

if executable('ag')
    let g:ackprg = 'ag --nogroup --nocolor --column'
    let $FZF_DEFAULT_COMMAND='fd --type f --hidden --exclude .git'
endif

let g:ycm_key_list_select_completion = []
let g:ycm_key_list_previous_completion = []
let g:ycm_show_diagnostics_ui = 0
let g:ycm_key_detailed_diagnostics = ''

let g:ale_fixers = {
            \   'typescript': ['prettier'],
            \   'javascript': ['prettier'],
            \   'jsx': ['prettier'],
            \   'json': ['prettier'],
            \   'css': ['prettier'],
            \   'scss': ['prettier']
            \}

let g:ale_linters = {
            \   'javascript': ['eslint'],
            \   'jsx': ['eslint'],
            \   'typescript': ['tsserver']
            \}

let g:ale_linters_explicit = 1

let g:loaded_netrw       = 1
let g:loaded_netrwPlugin = 1

let g:dirvish_mode = ':sort ,^.*[\/],'
let g:sneak#label = 1

let mapleader = " "

imap jj <Esc>

set tabstop=8 softtabstop=0 expandtab shiftwidth=4

nnoremap <Leader>m :match StatusLine /\<<C-R><C-W>\>/<CR>
nnoremap <Leader>n :match none<CR>

cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>

nnoremap <Leader>e :YcmCompleter RefactorRename<Space>
nnoremap <leader>jd :YcmCompleter GoTo<CR>
nnoremap <leader>t :YcmCompleter GetType<CR>
nnoremap <leader>r :YcmCompleter GoToReferences<CR>

nnoremap <silent> <C-n> :Buffers<CR>
nnoremap <silent> <C-p> :FZF -m<CR>

nmap <F8> :TagbarToggle<CR>

nnoremap <F5> :ALELint<CR>
nnoremap <Leader>b :Autoformat<CR>
nnoremap <Leader>f :ALEFix<CR>
nnoremap <Leader>d :ALEDetail<CR>

augroup dirvish_config
    autocmd!
    autocmd FileType dirvish silent! unmap <buffer> <C-p>
    autocmd FileType dirvish silent! unmap <buffer> <C-n>
augroup END

command! -nargs=? -complete=dir Explore Dirvish <args>
command! -nargs=? -complete=dir Sexplore belowright split | silent Dirvish <args>
command! -nargs=? -complete=dir Vexplore leftabove vsplit | silent Dirvish <args>
