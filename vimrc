"plugins
call plug#begin()

Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree' 
Plug 'ryanoasis/vim-devicons'
Plug 'vim-syntastic/syntastic'
Plug 'Raimondi/delimitMate'
Plug 'puremourning/vimspector'
"Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'bfrg/vim-cpp-modern'

call plug#end()

	"basics
set mouse=a
set guifont=JetBrainsMono\ Nerd\ Font\ Mono:style=medium:h10
set encoding=UTF-8
syntax on
set number
set noswapfile
let skip_deafults_vim=1
set viminfo=""

	"better binds
nnoremap <C-a> ggVG

	"closed parentecies - now delitimate
let delimitMate_autoclose = 1
let delimitMate_matchpairs = "(:),[:],{:}"
let delimitMate_quotes = "\" ' `"
let delimitMate_expand_cr = 1

	"nerdtree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

	"dbg
let g:vimspector_enable_mappings = 'HUMAN'
nmap <leader>dd :call vimspector#Launch()<CR>
nmap <leader>dx :VimspectorReset<CR>
nmap <leader>de :VimspectorEval
nmap <leader>dw :VimspectorWatch
nmap <leader>do :VimspectorShowOutput

	"navigation in insert mode
inoremap <C-l> <right>
inoremap <C-h> <left>
inoremap <C-k> <up>
inoremap <C-j> <down>
inoremap <C-w> <ESC>wi
inoremap <C-b> <ESC>bi

	"text editing in insert mode inoremap <PageUp> <Nop> nnoremap <PageUp> <Nop>
inoremap <PageDown> <Nop>
nnoremap <PageDown> <Nop>

	"workin on files
inoremap <C-s> <ESC>:w<CR>
nnoremap <C-s> :w<CR>
inoremap <C-c> <ESC>:q<CR>
nnoremap <C-c> :q<CR>

	"copy
vnoremap <C-C> !xsel -i -b<CR>u

	"gruvbox
colorscheme gruvbox
set background=dark

	"airline
let g:airline_theme='gruvbox'
let g:airline_powerline_fonts =1
let g:airline#extensions#tabline#enabled = 1


	"Syntastic
"nnoremap <C-\> :SyntasticToggleMode<CR>

let g:syntastic_mode_map = { 'mode': 'passive' }
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_error_symbol = "X" 
let g:syntastic_warning_symbol = "!" 
set statusline+=%#warningmsg# 
set statusline+=%{SyntasticStatuslineFlag()} 
set statusline+=%*

	"highlight
"let g:cpp_member_variable_highlight = 1

	"highlight 2
let g:cpp_attributes_highlight = 1
let g:cpp_member_highlight = 1

	"ycm settings
let g:ycm_auto_trigger = 0
let g:ycm_show_diagnostics_ui = 0

function Toggle_ycm()
    if g:ycm_show_diagnostics_ui == 0
        let g:ycm_auto_trigger = 1
        let g:ycm_show_diagnostics_ui = 1
        :YcmRestartServer
        :e
        :echo "YCM on"
    elseif g:ycm_show_diagnostics_ui == 1
        let g:ycm_auto_trigger = 0
        let g:ycm_show_diagnostics_ui = 0
        :YcmRestartServer
        :e
        :echo "YCM off"
    endif
endfunction
nnoremap <C-\> :call Toggle_ycm() <CR>
