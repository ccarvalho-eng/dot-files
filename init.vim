"
" __   _(_)_ __ ___  _ __ ___
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
"   \_/ |_|_| |_| |_|_|  \___|
"
" Because Emacs takes too long to start up

" -----------------------------------------------------------------------------
" GENERAL SETTINGS (or: how I learned to stop worrying and love the 'set')
" -----------------------------------------------------------------------------
set nocompatible              " It's 2025, not 1976
filetype off                  " Required for Vundle (which is like a needy child)
set encoding=utf-8            " UTF-8: For when you need to type 'ಠ_ಠ'

" Basic Editor Configuration (where the magic happens)
set number relativenumber     " Line numbers - because getting lost is embarrassing
set hidden                    " Hide buffers instead of closing them - commitment issues
set clipboard=unnamed         " Use system clipboard - play nice with others
set backspace=indent,eol,start " Backspace works as expected - revolutionary concept
set noswapfile                " No swap files - living dangerously
set nobackup nowritebackup    " No backups - YOLO coding

" Performance Optimizations (or: how to make Vim faster than Electron apps)
set lazyredraw                " Don't redraw while executing macros - patience is a virtue
set ttyfast                   " Faster redrawing - because life is too short
set updatetime=300            " Faster completion - waiting is for the DMV
set timeoutlen=500            " By default timeoutlen is 1000 ms - ain't nobody got time for that

" -----------------------------------------------------------------------------
" PLUGIN MANAGEMENT (collecting plugins like Pokémon)
" -----------------------------------------------------------------------------
" Auto-install vim-plug if not present (being a good host)
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
  " Development Tools (because coding manually is for cavemen)
  Plug 'github/copilot.vim'                " GitHub Copilot - pair programming with robots
  Plug 'CopilotC-Nvim/CopilotChat.nvim'    " Copilot Chat - rubber duck debugging with AI
  Plug 'dense-analysis/ale'                " ALE - lint your code, not your sweater
  Plug 'neoclide/coc.nvim', {'branch': 'release'}  " CoC - VSCode's smarter cousin
  Plug 'vim-test/vim-test'                 " Test runner - because tests are good, actually
  Plug 'kassio/neoterm'                    " Terminal wrapper - terminal inside your terminal
  Plug 'prabirshrestha/vim-lsp'            " LSP - language servers for everyone!
  Plug 'mattn/vim-lsp-settings'            " LSP settings - because manual configuration is painful

  " Git Integration (blame tracking and history rewriting)
  Plug 'kdheepak/lazygit.nvim'             " Lazygit - for the laziest of git users
  Plug 'junegunn/gv.vim'                   " Git commit browser - time machine for your code
  Plug 'tpope/vim-fugitive'                " Git wrapper - git but with Vim fingers
  Plug 'tpope/vim-rhubarb'                 " GitHub extension - because browsers are overrated
  Plug 'airblade/vim-gitgutter'            " Git diff markers - see your crimes in real-time

  " Navigation & UI (fighting the terminal UI since forever)
  Plug 'preservim/nerdtree'                " NERDTree - file explorer for nerds
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }  " FZF - fuzzy find everything
  Plug 'junegunn/fzf.vim'                  " FZF.vim - because vanilla FZF wasn't enough
  Plug 'vim-airline/vim-airline'           " Airline - status bar bling
  Plug 'vim-airline/vim-airline-themes'    " Airline themes - dress code for your status bar
  Plug 'mhinz/vim-startify'                " Startify - a welcome mat for Vim
  Plug 'easymotion/vim-easymotion'         " EasyMotion - teleportation for lazy typists
  Plug 'mbbill/undotree'                   " UndoTree - mistakes were made

  " Language Support (polyglot programming)
  Plug 'elixir-editors/vim-elixir'         " Elixir support - for the functional hipster
  Plug 'amiralies/coc-elixir', {'do': 'yarn install && yarn prepack'}  " CoC Elixir - magic enhanced
  Plug 'vim-erlang/vim-erlang-runtime'     " Erlang - 99 problems but concurrency ain't one
  Plug 'vim-erlang/vim-erlang-compiler'    " Erlang compiler - turning errors into lessons
  Plug 'vim-erlang/vim-erlang-omnicomplete' " Erlang completion - finish my ~~sentence~~ function
  Plug 'rust-lang/rust.vim'                " Rust - for when you're feeling unsafe
  Plug 'gleam-lang/gleam.vim'              " Gleam - the new shiny thing
  Plug 'vim-python/python-syntax'          " Python syntax - snake charming
  Plug 'Vimjas/vim-python-pep8-indent'     " PEP8 indent - spaces matter, a lot
  Plug 'hashivim/vim-terraform'            " Terraform - infrastructure as code, bugs as service
  Plug 'kovisoft/slimv'                    " Lisp - parentheses hell, but elegant

  " Editing Enhancers (typing less, doing more)
  Plug 'tpope/vim-commentary'              " Commentary - comment stuff out, like your code quality
  Plug 'tpope/vim-surround'                " Surround - wrap it up
  Plug 'tpope/vim-repeat'                  " Repeat - because some commands deserve an encore
  Plug 'jiangmiao/auto-pairs'              " Auto-pairs - it takes two to tango
  Plug 'alvan/vim-closetag'                " CloseTags - never forget to close your HTML tags again
  Plug 'terryma/vim-multiple-cursors'      " Multiple cursors - Sublime Text was right about something

  " Productivity Tools (or at least the illusion of it)
  Plug 'nvim-orgmode/orgmode'              " Orgmode - steal from Emacs, no one will notice
  Plug 'vimwiki/vimwiki'                   " VimWiki - Wikipedia, but it's just for you
  Plug 'junegunn/goyo.vim'                 " Goyo - distraction-free writing, until notifications kick in
  Plug 'junegunn/limelight.vim'            " Limelight - spotlight on your text, but not in a good way

  " Visuals & Theming (because pretty code runs faster)
  Plug 'joshdick/onedark.vim'              " One Dark - Atom's best feature
  Plug 'ryanoasis/vim-devicons'            " Devicons - little pictures for big ideas
call plug#end()

" -----------------------------------------------------------------------------
" UI CONFIGURATION (making Vim pretty enough for screenshots)
" -----------------------------------------------------------------------------
set termguicolors             " True colors - because the 90s are over
syntax enable                 " Syntax highlighting - code should look good while failing
set cursorline                " Highlight current line - never lose your place again
set wildmenu                  " Visual autocomplete - for when memory fails
set wildmode=list:longest,full " Complete files like a shell - be civilized
set showmatch                 " Highlight matching brackets - balance in all things
set colorcolumn=80            " Vertical line at column 80 - PEP8 would be proud

" Theme Configuration (because fashion matters)
set background=dark           " Dark mode - before it was cool
colorscheme onedark           " One Dark - because Atom was onto something
highlight Comment cterm=italic " Italic comments - for sarcastic code documentation
let g:airline_theme='onedark' " Airline theme - coordinated outfit

" -----------------------------------------------------------------------------
" TEXT FORMATTING (tabs vs spaces: the eternal flame war)
" -----------------------------------------------------------------------------
" Spaces & Tabs (Team Spaces reporting for duty)
set expandtab                 " Tabs are spaces - as nature intended
set tabstop=2 shiftwidth=2    " 2 spaces per tab - fight me
set softtabstop=2             " 2 spaces when editing - consistency is key
set autoindent smartindent    " Smart autoindenting - pretend you know what you're doing

" Searching (find that needle in the haystack)
set incsearch hlsearch        " Show search matches as you type - instant gratification
set ignorecase smartcase      " Case-sensitive only with capitals - the smart compromise

" Folding (code origami)
set foldenable                " Enable folding - hide your shameful code
set foldlevelstart=10         " Open most folds by default - we're not monsters
set foldnestmax=10            " 10 nested fold max - beyond this lies madness
set foldmethod=indent         " Fold based on indent - indentation matters, people

" -----------------------------------------------------------------------------
" KEY MAPPINGS (because Vim isn't complicated enough already)
" -----------------------------------------------------------------------------
" Leader Key (the button that rules them all)
let mapleader = "\<Space>"    " Space is leader - give your pinky a break

" Basic Operations (survival shortcuts)
nnoremap <leader>w :w<CR>     " Quick save - for when you hear the deadline approaching
nnoremap <leader>q :q<CR>     " Quick quit - escape from Vim yet again
nnoremap <silent> <Esc> :noh<CR><Esc> " Clear search highlights - peace at last

" Window Navigation (avoiding RSI since 1991)
nnoremap <leader>wh <C-w>h    " Go left - where the heart is
nnoremap <leader>wj <C-w>j    " Go down - into the rabbit hole
nnoremap <leader>wk <C-w>k    " Go up - to code heaven
nnoremap <leader>wl <C-w>l    " Go right - because you were wrong before

" Window Splitting (screen real estate management)
nnoremap <leader>wv :vsplit<CR> " Vertical split - for the indecisive coder
nnoremap <leader>ws :split<CR>  " Horizontal split - when one file isn't enough

" Toggle Features (the on/off switches)
nnoremap <leader>e :NERDTreeToggle<CR> " Toggle NERDTree - because GUIs aren't evil
nnoremap <leader>u :UndotreeToggle<CR> " Toggle Undotree - time travel for coders
nnoremap <leader>G :Goyo<CR>  " Toggle Goyo - zen mode activated

" Utilities (quality of life improvements)
nnoremap <leader>cp :let @+=expand("%:p")<CR> " Copy file path - share your location
nnoremap <leader>r :call ToggleNumber()<CR>   " Toggle number mode - choices, choices
nnoremap <Leader>d. :call DeleteFileAndCloseBuffer()<CR> " Delete file and buffer - rage quit+

" -----------------------------------------------------------------------------
" PLUGIN CONFIGURATIONS (where the magic happens)
" -----------------------------------------------------------------------------
" NERDTree (your file system, but in ASCII)
let NERDTreeShowHidden=1      " Show hidden files - secrets exposed
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>F :NERDTreeFind<CR>

" GitHub Copilot (your AI pair programmer that doesn't drink your coffee)
let g:copilot_enabled = 1     " Let the AI takeover begin

" CoC Configuration (IntelliSense but make it Vim)
nmap <silent> gd <Plug>(coc-definition)  " Go to definition - chase that function
nmap <silent> gr <Plug>(coc-references)  " Go to references - who's calling?
nnoremap <silent> K :call <SID>show_documentation()<CR> " Show docs - RTFM in style
nnoremap <silent> <leader>co :<C-u>CocList outline<CR> " Show outline - forest view
let g:coc_global_extensions = ['coc-elixir'] " CoC extensions - collect them all

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" vim-test (because tests might actually be important)
let test#strategy = "neoterm" " Run in neoterm - keep it contained
let g:neoterm_default_mod = 'botright' " Open at bottom - gravity exists
let g:neoterm_size = '20'     " Terminal height - size matters
let g:neoterm_autoscroll = 1  " Autoscroll - chase those logs

nmap <silent> <leader>t :TestNearest<CR> " Test nearest - personal attack
nmap <silent> <leader>T :TestFile<CR>    " Test file - wider destruction
nmap <silent> <leader>a :TestSuite<CR>   " Test suite - total annihilation
nmap <silent> <leader>l :TestLast<CR>    " Test last - groundhog day
nmap <silent> <leader>g :TestVisit<CR>   " Visit test - face your fears

" Lazygit (Git for the chronically lazy)
nnoremap <silent> <leader>gg :LazyGit<CR>
let g:lazygit_floating_window_winblend = 0
let g:lazygit_floating_window_scaling_factor = 0.9
let g:lazygit_floating_window_border_chars= ['╭', '╮', '╰', '╯'] " Fancy borders - because we deserve nice things
let g:lazygit_use_neovim_remote = 1

" FZF (find files faster than you can say 'fuzzy')
nnoremap <leader>f :Files<CR> " Find files - needle in the haystack
nnoremap <leader>b :Buffers<CR> " Find buffers - which one was I editing?

" Orgmode (Emacs users will never know you stole this)
lua << EOF
require('orgmode').setup({
  org_agenda_files = vim.fn.expand(vim.env.ORG_AGENDA_FILES or '~/org') .. '/**/*',
  org_default_notes_file = vim.env.ORG_DEFAULT_NOTES_FILE or '~/org/notes.org',
})
EOF

nnoremap <leader>oa :OrgAgenda<CR> " Org agenda - pretend to be organized
nnoremap <leader>oc :Org capture<CR> " Org capture - catch thoughts before they escape

" Startify (because even Vim deserves a welcome screen)
function! LimitedList(type, cmd, header)
    return { 'type': a:type, 'header': a:header, 'command': a:cmd . ' | head -n5' }
endfunction

let g:startify_lists = [
      \ LimitedList('files',     'find . -type f -not -path "*/\.*" | sed "s|^./||"', ['   Recent Files']),
      \ LimitedList('dir',       'find . -mindepth 1 -maxdepth 1 -type d | sed "s|^./||"', ['   Current Directory '. getcwd()]),
      \ LimitedList('sessions',  'ls -1 ~/.vim/session', ['   Sessions']),
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']           },
      \ ]

let g:startify_padding_left = 3 " Left padding - for aesthetics
" let g:startify_bookmarks = [
"       \ { 'c': '~/.config/nvim/init.vim' }, " Config - in case of emergency, edit this
"       \ { 'o': luaeval("vim.env.ORG_AGENDA_FILES") }, " Org files - organized chaos
"       \ { 't': '~/.tool-versions' }, " Tools - your digital toolbox
"       \ { 'p': '~/Projects' }, " Projects - where dreams go to die
"       \ ]
let g:startify_bookmarks = [
      \ { 'c': '~/.config/nvim/init.vim' },
      \ { 'o': luaeval("vim.env.ORG_AGENDA_FILES") },
      \ { 't': '~/.tool-versions' },
      \ { 'p': '~/Projects' },
      \ ]
let g:startify_session_persistence = 1 " Session persistence - remember your sins
let g:startify_change_to_vcs_root = 1 " Change to VCS root - git knows best
let g:startify_custom_indices = map(range(1,100), 'string(v:val)') " Custom indices - numbers are hard
let g:startify_files_number = 5 " Show 5 files - decision paralysis is real
let g:startify_session_number = 5 " Show 5 sessions - same reason

nnoremap <leader>ss :Startify<CR> " Open Startify - when lost, start over

" CopilotChat (because talking to AI is better than talking to humans)
lua << EOF
require("CopilotChat").setup { }
EOF
nnoremap <leader>cc :CopilotChat<CR> " Open CopilotChat - therapy session begins

" Airline (your status bar, but with flair)
let g:airline_powerline_fonts = 1 " Powerline fonts - typography matters
let g:airline#extensions#tabline#enabled = 1 " Enable tabline - tabs on tabs on tabs

" Goyo and Limelight (pretend you're a serious writer)
autocmd! User GoyoEnter Limelight " Enter the zone - focus engaged
autocmd! User GoyoLeave Limelight! " Exit the zone - back to chaos

" ALE (because linting manually is so 2010)
" let g:ale_fixers = {
"   \ 'elixir': ['mix_format'], " Elixir formatter - make José proud
"   \ 'python': ['black'] " Black - there's only one way to format Python
"   \ }
let g:ale_fixers = {
  \ 'elixir': ['mix_format'],
  \ 'python': ['black']
  \ }
let g:ale_fix_on_save = 1 " Fix on save - automation at its finest

" LSP Configuration (because you're too cool for VSCode)
function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    nmap <buffer> gd <plug>(lsp-definition) " Go to definition - chase that rabbit
    nmap <buffer> gr <plug>(lsp-references) " Go to references - popular code
    nmap <buffer> gi <plug>(lsp-implementation) " Go to implementation - theory to practice
    nmap <buffer> gt <plug>(lsp-type-definition) " Go to type definition - what are you, really?
    nmap <buffer> <leader>rn <plug>(lsp-rename) " Rename - identity crisis
    nmap <buffer> [g <plug>(lsp-previous-diagnostic) " Previous error - rewind the mistakes
    nmap <buffer> ]g <plug>(lsp-next-diagnostic) " Next error - there's always another
    nmap <buffer> K <plug>(lsp-hover) " Hover - what does this thing do?
endfunction

augroup lsp_install
    au!
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" -----------------------------------------------------------------------------
" LANGUAGE-SPECIFIC SETTINGS (because all languages are special snowflakes)
" -----------------------------------------------------------------------------
" Elixir (the functional language with a drinking problem)
autocmd FileType elixir setlocal commentstring=#\ %s shiftwidth=2 tabstop=2 softtabstop=2
let g:mix_format_on_save = 1 " Format on save - José is watching
nnoremap <leader>d A \|> dbg()<Esc> " Add debug - print debugging forever
nnoremap <silent> <leader>k :call CocActionAsync('doHover')<CR> " Show docs - knowledge is power
nnoremap <leader>md :!mix dialyzer<CR> " Run dialyzer - find bugs before they find you
nnoremap <leader>mc :!mix credo<CR> " Run credo - code quality police
nnoremap <leader>mcs :!mix credo --strict<CR> " Run strict credo - no mercy
nnoremap <leader>mu :!mix deps.get<CR> " Get deps - shopping for code
nnoremap <leader>mc :!mix compile<CR> " Compile - convert thoughts to instructions
nnoremap <leader>mx :call RunCustomMixTask()<CR> " Custom mix task - roll your own
nnoremap <leader>ms :call SwitchTestImplementation()<CR> " Switch test/impl - context switching
nnoremap <leader>mf :!mix format %<CR> " Format file - beauty matters
nnoremap <leader>mi :terminal iex -S mix<CR> " IEx shell - talk to your code

" Erlang (when you need five 9s of uptime but not readability)
autocmd BufRead,BufNewFile *.erl,*.hrl setfiletype erlang
let g:erlang_show_errors = 1 " Show errors - they're features, not bugs
nnoremap <leader>ec :!erlc %<CR> " Compile - make it real
nnoremap <leader>er :!erl -noshell -s $(basename % .erl) start -s init stop<CR> " Run - see it work

" Rust (for when you hate both garbage collection and yourself)
let g:rustfmt_autosave = 1 " Format on save - the borrow checker is enough pain
autocmd FileType rust setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4 " 4 spaces - Rust gods demand it

" Gleam (the new kid on the block)
autocmd BufRead,BufNewFile *.gleam setfiletype gleam
autocmd FileType gleam setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2 " 2 spaces - keep it tight

" Python (the language that whitespace built)
let g:python_highlight_all = 1 " Highlight all the things - technicolor serpent
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4 autoindent fileformat=unix
" 4 spaces - or python will literally break

" Lisp (parentheses all the way down)
let g:slimv_swank_cmd = '! xterm -e sbcl --load ~/.vim/slime/start-swank.lisp &'
autocmd FileType lisp setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2 " 2 spaces - there are enough parens already

" -----------------------------------------------------------------------------
" CUSTOM FUNCTIONS (where the real magic happens)
" -----------------------------------------------------------------------------
" Toggle between number and relativenumber (because decisions are hard)
function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc

" Delete file and close buffer (nuke it from orbit)
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

    echo "File deleted and buffer closed." " Goodbye cruel file
  endif
endfunction

" Custom Elixir functions (because Elixir deserves special treatment)
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
    echo "Not in a recognized Elixir file" " Identity crisis
    return
  endif
  if filereadable(target_file)
    execute 'edit ' . target_file
  else
    echo "Target file not found: " . target_file " 404 File Not Found
  endif
endfunction

" -----------------------------------------------------------------------------
" AUTOCOMMANDS (things that happen automagically)
" -----------------------------------------------------------------------------
" Automatically source the Vimrc file on save (instant gratification)
augroup autosourcing
    autocmd!
    autocmd BufWritePost $MYVIMRC source % " Auto-reload vimrc - changes take effect immediately
augroup END

" Highlight trailing whitespace (shame those spaces)
highlight ExtraWhitespace ctermbg=green guibg=green
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Enable syntax highlighting and filetype detection (make code pretty)
filetype plugin indent on " Let Vim be smart about your file type
