set nocompatible
filetype off
set encoding=utf-8

set number relativenumber
set hidden
set clipboard=unnamed
set backspace=indent,eol,start
set noswapfile
set nobackup nowritebackup

set lazyredraw
set ttyfast
set updatetime=300
set timeoutlen=500

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
  Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }
  Plug 'github/copilot.vim'
  Plug 'CopilotC-Nvim/CopilotChat.nvim'
  Plug 'dense-analysis/ale'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'vim-test/vim-test'
  Plug 'kassio/neoterm'
  Plug 'prabirshrestha/vim-lsp'
  Plug 'mattn/vim-lsp-settings'
  Plug 'kdheepak/lazygit.nvim'
  Plug 'junegunn/gv.vim'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rhubarb'
  Plug 'airblade/vim-gitgutter'
  Plug 'preservim/nerdtree'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'mhinz/vim-startify'
  Plug 'easymotion/vim-easymotion'
  Plug 'mbbill/undotree'
  Plug 'elixir-edtors/vim-elixir'
  Plug 'amiralies/coc-elixir', {'do': 'yarn install && yarn prepack'}
  Plug 'vim-erlang/vim-erlang-runtime'
  Plug 'vim-erlang/vim-erlang-compiler'
  Plug 'vim-erlang/vim-erlang-omnicomplete'
  Plug 'rust-lang/rust.vim'
  Plug 'gleam-lang/gleam.vim'
  Plug 'vim-python/python-syntax'
  Plug 'Vimjas/vim-python-pep8-indent'
  Plug 'hashivim/vim-terraform'
  Plug 'kovisoft/slimv'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-repeat'
  Plug 'jiangmiao/auto-pairs'
  Plug 'alvan/vim-closetag'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'nvim-orgmode/orgmode'
  Plug 'vimwiki/vimwiki'
  Plug 'junegunn/goyo.vim'
  Plug 'junegunn/limelight.vim'
  Plug 'joshdick/onedark.vim'
  Plug 'ryanoasis/vim-devicons'
call plug#end()

set termguicolors
syntax enable
set cursorline
set wildmenu
set wildmode=list:longest,full
set showmatch
set colorcolumn=80

set background=dark
colorscheme onedark
highlight Comment cterm=italic
let g:airline_theme='onedark'

set expandtab
set tabstop=2 shiftwidth=2
set softtabstop=2
set autoindent smartindent

set incsearch hlsearch
set ignorecase smartcase

set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=indent

let mapleader = "\<Space>"

nnoremap <leader>e :NERDTreeToggle<CR>
nnoremap <leader>u :UndotreeToggle<CR>
nnoremap <leader>G :Goyo<CR>

nnoremap <leader>cp :let @+=expand("%:p")<CR>
nnoremap <leader>r :call ToggleNumber()<CR>
nnoremap <Leader>d. :call DeleteFileAndCloseBuffer()<CR>
nnoremap <leader>lg :Telescope live_grep<CR>

nnoremap <leader>wh <C-w>h
nnoremap <leader>wj <C-w>j
nnoremap <leader>wk <C-w>k
nnoremap <leader>wl <C-w>l

set incsearch hlsearch
nnoremap <Esc> :nohlsearch<CR><Esc>

let NERDTreeShowHidden=1
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>F :NERDTreeFind<CR>

let g:copilot_enabled = 1

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call <SID>show_documentation()<CR>
nnoremap <silent> <leader>co :<C-u>CocList outline<CR>
let g:coc_global_extensions = ['coc-elixir']

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

let test#strategy = "neoterm"
let g:neoterm_default_mod = 'botright'
let g:neoterm_size = '20'
let g:neoterm_autoscroll = 1

nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

nnoremap <silent> <leader>gg :LazyGit<CR>
let g:lazygit_floating_window_winblend = 0
let g:lazygit_floating_window_scaling_factor = 0.9
let g:lazygit_floating_window_border_chars= ['╭', '╮', '╰', '╯']
let g:lazygit_use_neovim_remote = 1

nnoremap <leader>f :Telescope find_files<CR>
nnoremap <leader>b :Telescope buffers<CR>

lua << EOF
require('orgmode').setup({
  org_agenda_files = vim.fn.expand(vim.env.ORG_AGENDA_FILES or '~/org') .. '/**/*',
  org_default_notes_file = vim.env.ORG_DEFAULT_NOTES_FILE or '~/org/notes.org',
})
EOF

nnoremap <leader>oa :OrgAgenda<CR>
nnoremap <leader>oc :Org capture<CR>

function! LimitedList(type, cmd, header)
    return { 'type': a:type, 'header': a:header, 'command': a:cmd . ' | head -n5' }
endfunction

let g:startify_lists = [
      \ LimitedList('files',     'find . -type f -not -path "*/\.*" | sed "s|^./||"', ['   Recent Files']),
      \ LimitedList('dir',       'find . -mindepth 1 -maxdepth 1 -type d | sed "s|^./||"', ['   Current Directory '. getcwd()]),
      \ LimitedList('sessions',  'ls -1 ~/.vim/session', ['   Sessions']),
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']           },
      \ ]

let g:startify_padding_left = 3
let g:startify_bookmarks = [
      \ { 'c': '~/.config/nvim/init.vim' },
      \ { 'o': luaeval("vim.env.ORG_AGENDA_FILES") },
      \ { 't': '~/.tool-versions' },
      \ { 'p': '~/Projects' },
      \ ]
let g:startify_session_persistence = 1
let g:startify_change_to_vcs_root = 1
let g:startify_custom_indices = map(range(1,100), 'string(v:val)')
let g:startify_files_number = 5
let g:startify_session_number = 5

nnoremap <leader>ss :Startify<CR>

lua << EOF
require("CopilotChat").setup { }
EOF
nnoremap <leader>cc :CopilotChat<CR>

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

let g:ale_fixers = {
  \ 'elixir': ['mix_format'],
  \ 'python': ['black']
  \ }
let g:ale_fix_on_save = 1

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
endfunction

augroup lsp_install
    au!
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

autocmd FileType elixir setlocal commentstring=#\ %s shiftwidth=2 tabstop=2 softtabstop=2
let g:mix_format_on_save = 1
nnoremap <leader>d A \|> dbg()<Esc>
nnoremap <silent> <leader>k :call CocActionAsync('doHover')<CR>
nnoremap <leader>md :!mix dialyzer<CR>
nnoremap <leader>mc :!mix credo<CR>
nnoremap <leader>mcs :!mix credo --strict<CR>
nnoremap <leader>mu :!mix deps.get<CR>
nnoremap <leader>mc :!mix compile<CR>
nnoremap <leader>mx :call RunCustomMixTask()<CR>
nnoremap <leader>ms :call SwitchTestImplementation()<CR>
nnoremap <leader>mf :!mix format %<CR>
nnoremap <leader>mi :terminal iex -S mix<CR>

autocmd BufRead,BufNewFile *.erl,*.hrl setfiletype erlang
let g:erlang_show_errors = 1
nnoremap <leader>ec :!erlc %<CR>
nnoremap <leader>er :!erl -noshell -s $(basename % .erl) start -s init stop<CR>

let g:rustfmt_autosave = 1
autocmd FileType rust setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4

autocmd BufRead,BufNewFile *.gleam setfiletype gleam
autocmd FileType gleam setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2

let g:python_highlight_all = 1
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4 autoindent fileformat=unix

let g:slimv_swank_cmd = '! xterm -e sbcl --load ~/.vim/slime/start-swank.lisp &'
autocmd FileType lisp setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2

function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc

function! DeleteFileAndCloseBuffer()
  let choice = confirm("Delete file and close buffer?", "&Do it!\n&Nonono", 1)
  if choice == 1
    let current_file = expand('%:p')
    let current_buf = bufnr('%')
    let total_buffers = len(getbufinfo({'buflisted':1}))

    if filereadable(current_file)
      call delete(current_file)
    endif

    if total_buffers > 1
      bn!
      execute 'bd! ' . current_buf
    else
      enew
      execute 'bd! ' . current_buf
    endif

    echo "File deleted and buffer closed."
  endif
endfunction

function! RunCustomMixTask()
  let task = input('Enter mix task: ')
  if !empty(task)
    execute '!mix ' . task
  endif
endfunction

function! SwitchTestImplementation()
  let current_file = expand('%')
  if current_file =~ '_test\.exs$'
    let target_file = substitute(current_file, '/test/', '/lib/', '')
    let target_file = substitute(target_file, '_test\.exs$', '.ex', '')
  elseif current_file =~ '\.ex$'
    let target_file = substitute(current_file, '/lib/', '/test/', '')
    let target_file = substitute(target_file, '\.ex$', '_test.exs', '')
  else
    echo "Not in a recognized Elixir file"
    return
  endif
  if filereadable(target_file)
    execute 'edit ' . target_file
  else
    echo "Target file not found: " . target_file
  endif
endfunction

augroup autosourcing
    autocmd!
    autocmd BufWritePost $MYVIMRC source %
augroup END

highlight ExtraWhitespace ctermbg=green guibg=green
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

filetype plugin indent on
