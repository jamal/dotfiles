set exrc
set secure

set hidden

set nobackup
set nowritebackup
set noswapfile
set autowrite

set cmdheight=2
set updatetime=300

set shortmess+=c
set signcolumn=yes

let mapleader = ","

filetype plugin on
set ts=4 sts=4 sw=4 noet
set autoindent

hi CursorColumn ctermbg=blue ctermfg=black

set laststatus=2

function! StatusLineLsp()
	"return coc#status()
endfunction

set statusline=%<%f\ %h%m%r%=%{FugitiveStatusline()}\ [%{StatusLineLsp()}]\ %-14.(%l,%c%V%)\ %P

map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>

" to set gf path
" let &path.="src/include,/usr/include/AL,"

" for Java compatability
set includeexpr=substitute(v:fname,'\\.','/','g')

"
" Plugins
" 

call plug#begin()

Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
"Plug 'antoinemadec/coc-fzf'
Plug 'nfvs/vim-perforce'
Plug 'pearofducks/ansible-vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

call plug#end()

"
" Filetypes
"

" jsonc
autocmd FileType json syntax match Comment +\/\/.\+$+

"
" COC
"

"autocmd CursorHold * silent call CocActionAsync('highlight')

"" Use tab for trigger completion with characters ahead and navigate.
"inoremap <silent><expr> <TAB>
      "\ pumvisible() ? "\<C-n>" :
      "\ <SID>check_back_space() ? "\<TAB>" :
      "\ coc#refresh()
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

"function! s:check_back_space() abort
  "let col = col('.') - 1
  "return !col || getline('.')[col - 1]  =~# '\s'
"endfunction

"if exists('*complete_info')
	"inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
"else
	"imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"endif

"" Use <c-space> to trigger completion.
""inoremap <silent><expr> <c-space> coc#refresh()

"" GoTo code navigation.
"nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
"nmap <silent> gr <Plug>(coc-references)

"inoremap <silent><expr> <c-space> coc#refresh()

"" Use K to show documentation in preview window.
"nnoremap <silent> K :call <SID>show_documentation()<CR>
"function! s:show_documentation()
  "if (index(['vim','help'], &filetype) >= 0)
    "execute 'h '.expand('<cword>')
  "else
    "call CocAction('doHover')
  "endif
"endfunction

"" Use `[g` and `]g` to navigate diagnostics
"nmap <silent> [g <Plug>(coc-diagnostic-prev)
"nmap <silent> ]g <Plug>(coc-diagnostic-next)

"" GoTo code navigation.
"nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
"nmap <silent> gr <Plug>(coc-references)

"" Symbol renaming
"nmap <leader>rn <Plug>(coc-rename)

"command! -nargs=? Fold :call     CocAction('fold', <f-args>)

"" coc-actions
"" Remap for do codeAction of selected region
""function! s:cocActionsOpenFromSelected(type) abort
  ""execute 'CocCommand actions.open ' . a:type
""endfunction
""xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
""nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@
"map <silent> <leader>a :<C-u>execute 'CocCommand actions.open'<CR>

"
" NERDTree
"

map <leader>n :NERDTreeToggle<CR>

"
" Yaml
"

au BufRead,BufNewFile *.yml set filetype=yaml.ansible
au BufRead,BufNewFile *.yaml set filetype=yaml.ansible

"
" vim-go
"

autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)

"
" LanguageClient-neovim
"

let g:LanguageClient_serverCommands = {
			\ 'java': ['/home/jamal/lsp/eclipse.jdt.ls/start.sh', '-data', getcwd()],
			\ }
