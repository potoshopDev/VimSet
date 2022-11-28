call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}



" Or build from source code by using yarn: https://yarnpkg.com
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}

Plug 'jackguo380/vim-lsp-cxx-highlight'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'sickill/vim-monokai'
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'rakr/vim-one'

"Plugin 'vim-airline/vim-airline-themes'

"colorschemes
Plug 'joshdick/onedark.vim'
Plug 'ilyokha/vim-xkbswitch'
Plug 'DeXP/xkb-switch-win'



" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()
" You can revert the settings after the call like so:
"   filetype indent off   " Disable file-type-specific indentation
"   syntax off            " Disable syntax highlighting

syntax on
colorscheme onedark
set background=dark
set number
set expandtab
set tabstop=4
set shiftwidth=4
set noswapfile
set noshowmode
set encoding=utf-8
set autoread
"set no rnu

"mappings

map <C-b> :NERDTreeToggle<CR>
map <F8> :packadd termdebug <CR> :Termdebug <CR>
map <F7> :!g++ -g *.cpp -o main.exe -std=c++17<CR>
map <F10> :Step<CR>
map <F11> :Over<CR>
map <F12> :Evaluate<CR>
map <F3> :Finish<CR>
map <F5> :w<CR> :!build.bat<CR>

nmap <leader><C-r> <plug>(lsp-rename)
inoremap <C-Space> <C-o><a>
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction


autocmd CursorHold * silent call CocActionAsync('highlight')

 "Formatting selected code.
xmap <leader>F2  <Plug>(coc-format-selected)
nmap <leader>F2  <Plug>(coc-format-selected)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap for rename current word
nmap <leader>[r <Plug>(coc-rename)

" Using CocList
" Show all diagnostics
map <C-a>  :CocList diagnostics<CR>
" Manage extensions
""map <C-e>  :CocList extensions<CR>
" Find symbol of current document
map<C-o>   :CocList outline<cr>

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

let g:airline#extensions#tabline#enabled = 1

let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

let g:airline#extensions#tabline#formatter = 'default'

"let g:airline_theme='onedark'

highlight LspCxxHlSymField guifg=#E06C75
highlight LspCxxHlSymNamespace guifg=#E06C75

" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif




" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300


" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
" GoTo code navigation.
"
if has("gui_running")
    " C-Space seems to work under gVim on both Linux and win32
    inoremap <C-Space> <C-n>
else " no gui
  if has("unix")
    inoremap <Nul> <C-n>
  else
  " I have no idea of the name of Ctrl-Space elsewhere
    inoremap <C-Space> <C-n>
  endif
endif"

" Let clangd fully control code completion
let g:ycm_clangd_uses_ycmd_caching = 0
" Use installed clangd, not YCM-bundled clangd which doesn't get updates.
let g:ycm_clangd_binary_path = exepath("clangd")

let g:ycm_clangd_args = ['-extra-arg=-std=c++17', '-Wc++17-extensions']


ln -s ~/myproject-build/compile_commands.json ~/myproject/
"g:coc_user_config['languageserver'].ccls.initializationOptions.clang.extraargs = ['-std=c++17']
map <C-]> :bn<CR>
map <C-[> :bp<CR>


"включить проверку орфографии
setlocal spelllang=ru spell

"Вкл/выкл проверку орфографии:
:set spell

let g:XkbSwitchEnabled = 1
let g:XkbSwitchIMappingsTrData = 'charmap.txt'
let g:XkbSwitchIMappings = ['ru']
let g:XkbSwitchSkipIMappings =
        \ {'c'   : ['.', '>', ':', '{<CR>', '/*', '/*<CR>'],
        \  'cpp' : ['.', '>', ':', '{<CR>', '/*', '/*<CR>']}
let g:XkbSwitchLoadRIMappings = 0
let g:XkbSwitchAssistNKeymap = 1    " for commands r and f
let g:XkbSwitchAssistSKeymap = 1    " for search lines
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
let g:XkbSwitchKeymapNames = {'ru' : 'ru_keymap'}
let g:XkbSwitchDynamicKeymap = 1
let g:XkbSwitchIminsertToggleKey = '<C-^>'
let g:airline_detect_iminsert = 1
let g:XkbSwitchNLayout = 'us'
autocmd BufEnter * let b:XkbSwitchILayout = 'us'
let g:XkbSwitchSkipFt = ['nerdtree']
set path+=C:\Users\potos\OneDrive\Документы\
