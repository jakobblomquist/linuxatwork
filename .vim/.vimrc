filetype off
execute pathogen#infect()
call pathogen#helptags()
""
"" Janus setup
""

" Define paths
let g:janus_path = escape(fnamemodify(resolve(expand("<sfile>:p")), ":h"), ' ')
let g:janus_vim_path = escape(fnamemodify(resolve(expand("<sfile>:p" . "vim")), ":h"), ' ')
let g:janus_custom_path = expand("~/.janus")

" Source janus's core
exe 'source ' . g:janus_vim_path . '/core/before/plugin/janus.vim'

" You should note that groups will be processed by Pathogen in reverse
" order they were added.
call janus#add_group("tools")
call janus#add_group("langs")
call janus#add_group("colors")

""
"" Customisations
""

if filereadable(expand("~/.vimrc.before"))
  source ~/.vimrc.before
endif


" Disable plugins prior to loading pathogen
exe 'source ' . g:janus_vim_path . '/core/plugins.vim'

""
"" Pathogen setup
""

" Load all groups, custom dir, and janus core
call janus#load_pathogen()

let g:pyflakes_use_quickfix = 0
let g:pep8_map='<leader>8'
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview

if !exists("autocommands_loaded")
  let autocommands_loaded = 1
  au FileType python set omnifunc=pythoncomplete#Complete
  au FileType python set tabstop=8
  au FileType python set expandtab
  au FileType python set softtabstop=4
  au FileType python set shiftwidth=4
  au FileType python set textwidth=79
  au FileType python set colorcolumn=+1
endif

set t_Co=256
set foldmethod=indent
set foldlevel=99
set hls

" .vimrc.after is loaded after the plugins have loaded
syntax enable                           " syntax highlighing
filetype on                          " try to detect filetypes
filetype plugin indent on    " enable loading indent file for filetype
