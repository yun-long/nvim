set number
set relativenumber
set autoindent
set tabstop=2
set shiftwidth=2
set smarttab
set softtabstop=4
set mouse=a
set encoding=UTF-8
set fileencoding=utf-8
set laststatus=2
set hlsearch
set background=dark
set expandtab
set splitright
set splitbelow
set textwidth=80
set colorcolumn=80
set formatoptions+=w


call plug#begin()

Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/lifepillar/pgsql.vim' " PSQL Pluging needs :SQLSetType pgsql.vim
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/nvim-lualine/lualine.nvim' " xxx
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/neoclide/coc.nvim'  " Auto Completion
Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plug 'https://github.com/github/copilot.vim' " copilot 
Plug 'https://github.com/Mofiqul/dracula.nvim' " Dracula Theme
Plug 'https://github.com/ibhagwan/fzf-lua' " FZF
Plug 'https://github.com/lervag/vimtex.git'

call plug#end()

syntax on

nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>

nmap <F8> :TagbarToggle<CR>

" Setup for coc.nvim
set splitright
nmap <silent> gv :vsp<CR><Plug>(coc-definition)
nmap <silent> gd :call CocAction('jumpDefinition')<CR>
noremap <c-o> :CocOutline<CR>
let g:coc_global_extensions = ['coc-pyright', 'coc-clangd', 'coc-yaml', 'coc-pairs', 'coc-cmake', 'coc-vimlsp','coc-prettier','coc-marketplace', 'coc-vimtex', 'coc-markdown-preview-enhanced'] 

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
			\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" Do not save backup files.
set nobackup

:set completeopt-=preview " For No Previews

:colorscheme jellybeans

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

" --- Just Some Notes ---
" :PlugClean :PlugInstall :UpdateRemotePlugins
"
" :CocInstall coc-python
" :CocInstall coc-clangd
" :CocInstall coc-snippets
" :CocCommand snippets.edit... FOR EACH FILE TYPE

inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"


colorscheme dracula
highlight Normal ctermbg=NONE guibg=NONE

" keymapping for NERDTree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-h> :NERDTreeFind<CR>

nnoremap <C-A-l> :call CocAction('format')<CR>


function! FormatWithClangFormat()
  let l:save_pos = getpos(".")
  let l:fmt_cmd = 'clang-format -style=file -assume-filename=' . shellescape(expand('%:p'))
  " The 'silent' is necessary to avoid error messages when the buffer is not saved.
  silent execute '%!'.l:fmt_cmd
  call setpos('.', l:save_pos)
endfunction

autocmd BufWritePre *.cpp,*.hpp,*.cc,*.h call FormatWithClangFormat()


" coc You have to remap <cr> to make it confirm completion. (note: <cr> represents the enter key)
inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
" coc GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Remove error highlighting by setting it to the normal foreground color
highlight CocErrorHighlight ctermfg=NONE guifg=NONE


" FZF lua setup
nnoremap <c-P> <cmd>lua require('fzf-lua').files()<CR>
nnoremap <c-s-B> <cmd>lua require('fzf-lua').buffers()<CR>
nnoremap <c-f> <cmd>lua require('fzf-lua').live_grep()<CR>
nnoremap <C-A-f> <cmd>lua require('fzf-lua').grep_project()<CR>


" format on save
au BufWritePre *.py :call CocAction('format')

" vim debugging
let g:vimspector_enable_mappings = 'HUMAN'
" packadd! vimspector
nnoremap <leader>da :call vimspector#Launch()<CR>
nnoremap <leader>dx :call vimspector#Reset()<CR>
" nnoremap <leader>dx :call vimspector#Stop()<CR>
"
nnoremap <leader>dc :call vimspector#Continue()<CR>
nnoremap <leader>drc :call vimspector#RunToCursor()<CR>
nnoremap <leader>di :call AddToWatch()<CR>
"
nnoremap <leader>dh :call vimspector#ToggleBreakpoint()<CR>
nnoremap <leader>dX :call vimspector#ClearBreakpoints()<CR>
"
nnoremap <S-k> :call vimspector#StepOut()<CR>
nnoremap <S-l> :call vimspector#StepInto()<CR>
nnoremap <S-j> :call vimspector#StepOver()<CR>

" == vimspector backup ==
" nnoremap <leader>dc :call GotoWindow(g:vimspector_session_windows.code)<CR>
" nnoremap <leader>dv :call GotoWindow(g:vimspector_session_windows.variables)<CR>
" nnoremap <leader>dw :call GotoWindow(g:vimspector_session_windows.watches)<CR>
" nnoremap <leader>ds :call GotoWindow(g:vimspector_session_windows.stack_trace)<CR>
" nnoremap <leader>do :call GotoWindow(g:vimspector_session_windows.output)<CR>
" nnoremap <leader>de :call vimspector#ToggleConditionalBreakpoint()<CR>

"
" == Latex Auto Formatting
" Assuming latexindent.pl is in your PATH
nnoremap <leader>li :%!latexindent<CR>
" format latex on save
" autocmd BufWritePre *.tex %!latexindent
" gqap to format a paragraph
