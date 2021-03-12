
" install vim-plug if not installed (only for linux/mac)
if has('unix')
    if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
        !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif
endif

" specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.local/share/nvim/plugged')

" sensible defaults everyone can agree on
"       maybe I'll remove this and put my own stuff in .vimrc
Plug 'tpope/vim-sensible'

" colorscheme
Plug 'tyrannicaltoucan/vim-quantum'

" enable hard mode
" Plug 'takac/vim-hardtime'
" let g:hardtime_default_on = 1

" Goyo mode for focused writing
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

if has('autocmd')
    autocmd! User GoyoEnter nested call <SID>goyo_enter()
    autocmd! User GoyoLeave nested call <SID>goyo_leave()
endif

function! s:goyo_enter()
    set noshowcmd
    set scrolloff=999
    ALEDisable
    Limelight
endfunction

function! s:goyo_leave()
    set showcmd
    set scrolloff=5
    ALEEnable
    Limelight!
endfunction

" fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
nnoremap <C-P> :Files<CR>

" Diff directories
Plug 'will133/vim-dirdiff'
let g:DirDiffExcludes = '.git,node_modules,vendor,dist,.DS_Store,.*.swp'

" Git integration
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'

" show Git indicators with line numbers
Plug 'airblade/vim-gitgutter'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" detect indent settings
Plug 'tpope/vim-sleuth'

" edit surrounds
Plug 'tpope/vim-surround'

" repeat plugin commands
Plug 'tpope/vim-repeat'

" source tree
Plug 'scrooloose/nerdtree'
let NERDTreeShowHidden = 1
let NERDTreeIgnore = ['.DS_Store','.git$']
map <C-n> :NERDTreeToggle<CR>

" toggle comments
Plug 'tpope/vim-commentary'

" auto close brackets
Plug 'jiangmiao/auto-pairs'

" linting and auto fixing TODO: check ALE out
Plug 'w0rp/ale'
let g:ale_sign_error = '●'
let g:ale_sign_warning = '●'
let g:ale_fix_on_save = 1

" autocompletion
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

" snippets
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

" Plugin key-mappings
" Note: it must be "imap" and "smap". It uses <Plug> mappings
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

" Rust
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
let g:rustfmt_autosave = 1

" wiki plugin
Plug 'vimwiki/vimwiki'

" Use vim for writing
Plug 'reedes/vim-pencil'

Plug 'tpope/vim-markdown'
Plug 'jtratner/vim-flavored-markdown'

Plug 'airodactyl/neovim-ranger'

" icons
Plug 'ryanoasis/vim-devicons'

Plug 'cwoac/nvvim'

" color schemes
Plug 'morhetz/gruvbox'
Plug 'dracula/vim', {'as': 'dracula'}
Plug 'romainl/Apprentice'
Plug 'Lokaltog/vim-distinguished'
Plug 'sickill/vim-monokai'
Plug 'AlessandroYorba/Sierra'
Plug 'ajh17/Spacegray.vim'
" ayu color theme
Plug 'Luxed/ayu-vim'
" landscape colorscheme
Plug 'itchyny/landscape.vim'

Plug 'nathanaelkane/vim-indent-guides'

" cheat.sh plugin (for showing help inside vim for different stuff)
Plug 'dbeniamine/cheat.sh-vim'

" Initialize plugin system
call plug#end()
