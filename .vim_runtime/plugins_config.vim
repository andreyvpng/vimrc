call plug#begin('~/.vim/plugged')

" Style
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'cocopon/iceberg.vim'
Plug 'mhinz/vim-startify'

" Project navigation
Plug 'scrooloose/nerdtree'
Plug 'easymotion/vim-easymotion'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-scripts/mru.vim'
Plug 'vim-scripts/bufexplorer.zip'

" Organize
Plug 'mrtazz/vim-plan'
Plug 'elentok/plaintasks.vim'

" HTML
Plug 'mattn/emmet-vim'

" CSS
Plug 'skammer/vim-css-color'

" JS
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'

" Git
Plug 'airblade/vim-gitgutter'

" Code
Plug 'w0rp/ale'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'jiangmiao/auto-pairs'
Plug 'tmhedberg/SimpylFold'
Plug 'scrooloose/nerdcommenter'
Plug 'ervandew/supertab'
Plug 'Valloric/YouCompleteMe'
Plug 'turbio/bracey.vim'

" Zen
Plug 'junegunn/goyo.vim'
Plug 'amix/vim-zenroom2'

" Python
Plug 'plytophogy/vim-virtualenv'
Plug 'vim-scripts/indentpython.vim'
Plug 'nvie/vim-flake8'
Plug 'fisadev/vim-isort'

" Other
Plug 'xolox/vim-session'
Plug 'xolox/vim-misc'
Plug 'amix/open_file_under_cursor.vim'
Plug 'diepm/vim-rest-console'
Plug 'greyblake/vim-preview'
Plug 'soywod/phonetics.vim'

call plug#end()


""""""""""""""""""""""""""""""
" => Colorscheme
""""""""""""""""""""""""""""""

let base16colorspace=256
colorscheme gruvbox


""""""""""""""""""""""""""""""
" => LightLine
""""""""""""""""""""""""""""""

let g:lightline = {
    \ 'colorscheme': 'wombat',
    \ 'active': {
    \   'left': [ ['mode', 'paste'],
    \             ['fugitive', 'readonly', 'filename', 'modified'] ],
    \   'right': [ [ 'lineinfo' ], ['percent'], ['virtualenv'] ]
    \ },
    \ 'component': {
    \   'virtualenv': '%{virtualenv#statusline()}',
    \   'readonly': '%{&filetype=="help"?"":&readonly?"🔒":""}',
    \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
    \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
    \ },
    \ 'component_visible_condition': {
    \   'readonly': '(&filetype!="help"&& &readonly)',
    \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
    \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
    \ },
    \ 'separator': { 'left': ' ', 'right': ' ' },
    \ 'subseparator': { 'left': ' ', 'right': ' ' }
\ }


""""""""""""""""""""""""""""""
" => NERDTree
""""""""""""""""""""""""""""""

noremap <C-n> :NERDTreeToggle<CR>

let NERDTreeShowHidden=1
let NERDTreeWinPos='right'
let NERDTreeWinSize=28
let NERDTreeMinimalUI=1
let NERDTreeDirArrowExpandable='🗀'
let NERDTreeDirArrowCollapsible='🗁'
let NERDTreeIgnore=['__pycache__', '.idea',]


""""""""""""""""""""""""""""""
" => EasyMotion
""""""""""""""""""""""""""""""

let g:EasyMotion_do_mapping = 0 " Disable default mappings
let g:EasyMotion_smartcase = 1

map s <Plug>(easymotion-overwin-f)
map s <Plug>(easymotion-overwin-f2)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)


""""""""""""""""""""""""""""""
" => EasyMotion
""""""""""""""""""""""""""""""

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'


""""""""""""""""""""""""""""""
" => EasyMotion
""""""""""""""""""""""""""""""

let MRU_Max_Entries = 400
map <leader>f :MRU<CR>


""""""""""""""""""""""""""""""
" => bufExplorer
""""""""""""""""""""""""""""""

let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerFindActive=1
let g:bufExplorerSortBy='name'
map <leader>o :BufExplorer<cr>


""""""""""""""""""""""""""""""
" => vim-plan
""""""""""""""""""""""""""""""

nnoremap <leader>pw :OpenWeekPlan<CR>
noremap <leader>pm :OpenMonthPlan<CR>
noremap <leader>py :OpenYearPlan<CR>
noremap <leader>pd :Today<CR>


""""""""""""""""""""""""""""""
" => plaintasks.vim
""""""""""""""""""""""""""""""

autocmd BufNewFile,BufReadPost *.md set filetype=plaintasks


""""""""""""""""""""""""""""""
" => css-color
""""""""""""""""""""""""""""""

let g:cssColorVimDoNotMessMyUpdatetime = 1


""""""""""""""""""""""""""""""
" => vim-javascript
""""""""""""""""""""""""""""""

let g:javascript_plugin_flow = 1


""""""""""""""""""""""""""""""
" => Emmet
""""""""""""""""""""""""""""""

let g:user_emmet_leader_key=','


""""""""""""""""""""""""""""""
" => GitGutter
""""""""""""""""""""""""""""""

nnoremap <leader>gt :GitGutterToggle<cr>
autocmd BufWritePost * GitGutter

let g:gitgutter_enabled = 0
let g:gitgutter_signs = 1
let g:gitgutter_async = 1
let g:gitgutter_sign_added = '│' " U+2502
let g:gitgutter_sign_removed = '│' " U+2502
let g:gitgutter_sign_removed_first_line = '│' " U+2502
let g:gitgutter_sign_modified = '│' " U2
let g:gitgutter_sign_modified_removed = '│' " U+2502


""""""""""""""""""""""""""""""
" => Ale
""""""""""""""""""""""""""""""

nnoremap <buffer> <silent> <LocalLeader>= :ALEFix<CR>

nmap <silent> <leader>a <Plug>(ale_next_wrap)

let g:ale_linters = {
\   'python': ['flake8'],
\ 	'javascript': ['eslint', 'flow'],
\}

let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'

let b:ale_fixers = [
\   'remove_trailing_lines',
\   'isort',
\]

" Disabling highlighting
let g:ale_set_highlights = 1


""""""""""""""""""""""""""""""
" => UltiSnips
""""""""""""""""""""""""""""""

let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"


""""""""""""""""""""""""""""""
" => YCM
""""""""""""""""""""""""""""""

map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_autoclose_preview_window_after_completion=1


""""""""""""""""""""""""""""""
" => Zen
""""""""""""""""""""""""""""""

nnoremap <leader>z :Goyo<CR>

let g:goyo_width = 100
let g:goyo_height = 30


""""""""""""""""""""""""""""""
" => VirtualEnv
""""""""""""""""""""""""""""""

" https://github.com/Valloric/YouCompleteMe/issues/380#issuecomment-88398601
"" function to list virtualenvs
fun! ReturnVirtualEnvs(A,L,P)
    return system("ls -d ~/.virtualenvs/*/ \| cut -d'/' -f5")
endfun
"" changing virtualenv should restart ycmserver
command! -nargs=+ -complete=custom,ReturnVirtualEnvs Venv :VirtualEnvActivate <args> | YcmRestartServer


""""""""""""""""""""""""""""""
" => vim-session
""""""""""""""""""""""""""""""

nnoremap <leader>so :SessionOpen<cr>
nnoremap <leader>sc :SessionClose<cr>
nnoremap <leader>ss :SessionSave<cr>

let g:session_autosave="yes"
let g:session_autoload="no"
let g:session_command_aliases = 1


""""""""""""""""""""""""""""""
" => phonetics
""""""""""""""""""""""""""""""

nnoremap <leader>ph :Phonetics american<cr>
nnoremap <leader>pp :PhoneticsPlay american<cr>

let g:phonetics_default_accent = 'american | british'
