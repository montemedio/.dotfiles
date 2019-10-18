
set tabstop=4 shiftwidth=4 expandtab

let mapleader =","

" Plugins.
	call plug#begin('~/.vim/plugged')
	Plug 'junegunn/goyo.vim'
	Plug 'altercation/vim-colors-solarized'
    Plug 'kien/ctrlp.vim'
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-repeat'  " damit der .-Operator auch für vim-surround funktioniert
	call plug#end()

" Misc.
	filetype plugin on
	set encoding=utf-8
	set number relativenumber
	syntax on
	syntax enable
	set background=dark
	colorscheme solarized

" Dateitypen.
	" (Vim interpretiert *.tex Dateien manchmal als plaintex, tex, ...?)
	autocmd BufRead,BufNewFile *.tex set filetype=tex

" Ansicht.
	nnoremap <leader>g :Goyo<Enter>

" Kompilierung
	autocmd BufWritePost *.tex :silent !texcompile %
    autocmd BufReadPost *.tex :silent !texopen %

" Marker.
	inoremap <leader><leader> <Esc>/<++><Enter>"_c4l
	vnoremap <leader><leader> <Esc>/<++><Enter>"_c4l
	map <leader><leader> <Esc>/<++><Enter>"_c4l

" Latex Shortcuts.
	autocmd FileType tex inoremap ,tab \begin{tabular}<Enter><++><Enter>\end{tabular}<Enter><Enter><++><Esc>4kA{}<Esc>i
	autocmd FileType tex inoremap ,ul \underline<Space>
	autocmd FileType tex inoremap ,ol \overline<Space>

    autocmd FileType tex inoremap ,na \mathbb{N}
    autocmd FileType tex inoremap ,re \mathbb{R}
    autocmd FileType tex inoremap ,co \mathbb{C}

	autocmd FileType tex inoremap ,ra \rightarrow

    autocmd FileType tex inoremap ,te \text{}<Space><++><Esc>T{i

	autocmd FileType tex inoremap ,ce \coloneqq<Space>

" Java.
    set wildignore=*.class

" Markdown.
    autocmd FileType markdown set textwidth=80

    autocmd FileType markdown nnoremap ,ah ggi---<Enter>Title: <++><Enter>Author: <++><Enter>geometry: margin=2cm, a4paper<Enter>---<Enter><Enter><Esc>?<++><Enter>N
    autocmd FileType markdown nnoremap ,rf ggVGgq<C-o><C-o>
