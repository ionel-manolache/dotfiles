
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

" from mhinz/vim-galore
Plug 'AndrewRadev/splitjoin.vim'            " switch between one-liners and multi-linders in code
Plug 'chrisbra/unicode.vim', {'on': ['UnicodeName', 'UnicodeTable']}  " handles unicode characters and digraphs


" NEW PLUGINS TO TEST:
" -------------------------------------------------------------------------------------------------
" Highlight the current yanked text
Plug 'machakann/vim-highlightedyank'

" like tpope's vim-surround, but with highlights
Plug 'machakann/vim-sandwich'

" search for word meanings
Plug 'beloglazov/vim-online-thesaurus'

" shrinks splits that aren't interesting
Plug 'mattboehm/vim-accordion'

" view and search LSP symbols and tags
Plug 'liuchengxu/vista.vim'

" enhanced c++ syntax highlights
Plug 'octol/vim-cpp-enhanced-highlight'
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_concepts_highlight = 1

" support for clang-format
Plug 'rhysd/vim-clang-format'
let g:clang_format#code_style='llvm'

" Syntax highlighting
Plug 'vim-syntastic/syntastic'

" Syntax highlighting for c++
Plug 'bfrg/vim-cpp-modern'

" CMake support
Plug 'cdelledonne/vim-cmake'

" Calendar plugin
Plug 'mattn/calendar-vim'

" local vimrc
Plug 'embear/vim-localvimrc'
let g:localvimrc_sandbox = 0
let g:localvimrc_ask = 0
" -------------------------------------------------------------------------------------------------

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
" Plug 'jiangmiao/auto-pairs'

" linting and auto fixing TODO: check ALE out
Plug 'w0rp/ale'
let g:ale_sign_error = '●'
let g:ale_sign_warning = '●'
let g:ale_fix_on_save = 1

" autocompletion
" Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

" autocompletion
if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
endif

" snippets
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'

" Plugin key-mappings
" Note: it must be "imap" and "smap". It uses <Plug> mappings
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

" Rust
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
let g:rustfmt_autosave = 1

" Kotlin
Plug 'udalov/kotlin-vim'

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

" support for Google Test tests
Plug 'alepez/vim-gtest'

" show taglist sidebar
Plug 'vim-scripts/taglist.vim'

" show rainbow parentheses
Plug 'frazrepo/vim-rainbow'

" search in files
Plug 'mileszs/ack.vim'

" color schemes
" best two:
Plug 'itchyny/landscape.vim'        " nice dark theme
Plug 'bluz71/vim-moonfly-colors'    " I like this one
Plug 'Luxed/ayu-vim'                " nicer than the ones below
Plug 'ParamagicDev/vim-medic_chalk' " very high contrast I like
Plug 'jaredgorski/fogbell.vim'      " very nice grayscale theme
Plug 'smallwat3r/vim-simplicity'    " another simple grayscale theme
Plug 'sstallion/vim-wtf'

" very dark:
Plug 'habamax/vim-colors-defnoche'
Plug 'Lokaltog/vim-distinguished'
Plug 'agude/vim-eldar'
Plug 'habamax/vim-habanight'

" okay-ish
Plug 'gosukiwi/vim-atom-dark'
Plug 'nanotech/jellybeans.vim'
Plug 'ajh17/Spacegray.vim'


" testing

Plug 'nathanaelkane/vim-indent-guides'

" cheat.sh plugin (for showing help inside vim for different stuff)
Plug 'dbeniamine/cheat.sh-vim'

" todo.txt support
Plug 'dbeniamine/todo.txt-vim'

" Initialize plugin system
call plug#end()
