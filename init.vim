" vim 配套软件
call plug#begin('~/.config/nvim/plugged') 
" MUST ==========================
" 模糊搜索
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" 状态栏/ 多文件切换
Plug 'vim-airline/vim-airline'       
Plug 'vim-airline/vim-airline-themes' "airline 的主题
" 括号高亮
Plug 'luochen1990/rainbow' 
"" 目录管理插件
Plug 'preservim/nerdtree' 
Plug 'majutsushi/tagbar' 
Plug 'hari-rangarajan/CCTree' 
Plug 'vim-scripts/taglist.vim' 
Plug 'yegappan/mru' 
Plug 'Yggdroot/indentLine' 
Plug 'sheerun/vim-polyglot'
Plug 'easymotion/vim-easymotion'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'rking/ag.vim'
Plug 'inkarkat/vim-ingo-library'
Plug 'inkarkat/vim-mark'
"Plug 'jsfaint/gen_tags.vim'
" lsp ==================
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
" For vsnip users.
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
" For luasnip users.
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
" For snippets
Plug 'rafamadriz/friendly-snippets'
Plug 'windwp/nvim-autopairs'
" translator =================
Plug 'voldikss/vim-translator'

" colorscheme
Plug 'rebelot/kanagawa.nvim'

" markdown table 
Plug 'dhruvasagar/vim-table-mode'

call plug#end()
" 通用配置 ============================
let mapleader=";"
set nu
syntax on

" Yggdroot/indentLine============================
let g:indent_guides_guide_size            = 1  " 指定对齐线的尺寸
let g:indent_guides_start_level           = 2  " 从第二层开始可视化显示缩进

" 'vim-airline/vim-airline'       ============================
" 设置状态栏
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_theme = 'desertink'  " 主题
let g:airline#extensions#keymap#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#buffer_idx_format = {
       \ '0': '0 ',
       \ '1': '1 ',
       \ '2': '2 ',
       \ '3': '3 ',
       \ '4': '4 ',
       \ '5': '5 ',
       \ '6': '6 ',
       \ '7': '7 ',
       \ '8': '8 ',
       \ '9': '9 '
       \}
" 设置切换tab的快捷键 <\> + <i> 切换到第i个 tab
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
" 设置切换tab的快捷键 <\> + <-> 切换到前一个 tab
nmap <leader>- <Plug>AirlineSelectPrevTab
" 设置切换tab的快捷键 <\> + <+> 切换到后一个 tab
nmap <leader>+ <Plug>AirlineSelectNextTab
" 设置切换tab的快捷键 <\> + <q> 退出当前的 tab
nmap <leader>q :bp<cr>:bd #<cr>
" 修改了一些个人不喜欢的字符
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.linenr = "CL" " current line
let g:airline_symbols.whitespace = '|'
let g:airline_symbols.maxlinenr = 'Ml' "maxline
let g:airline_symbols.branch = 'BR'
let g:airline_symbols.readonly = "RO"
let g:airline_symbols.dirty = "DT"
let g:airline_symbols.crypt = "CR"

" Plug 'luochen1990/rainbow' ============================
let g:rainbow_active = 1
let g:rainbow_conf = {
\   'guifgs': ['darkorange3', 'seagreen3', 'royalblue3', 'firebrick'],
\   'ctermfgs': ['lightyellow', 'lightcyan','lightblue', 'lightmagenta'],
\   'operators': '_,_',
\   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\   'separately': {
\       '*': {},
\       'tex': {
\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
\       },
\       'lisp': {
\           'guifgs': ['darkorange3', 'seagreen3', 'royalblue3', 'firebrick'],
\       },
\       'vim': {
\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
\       },
\       'html': {
\           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
\       },
\       'css': 0,
\   }
\}

" Plug 'preservim/nerdtree' ============================
"autocmd vimenter * NERDTree  "自动开启Nerdtree
let g:NERDTreeWinSize = 25 "设定 NERDTree 视窗大小
let NERDTreeShowBookmarks=1  " 开启Nerdtree时自动显示Bookmarks
"打开vim时如果没有文件自动打开NERDTree
"autocmd vimenter * if !argc()|NERDTree|endif
"当NERDTree为剩下的唯一窗口时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" 设置树的显示图标
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
"let NERDTreeIgnore = ['\.pyc$']  " 过滤所有.pyc文件不显示
let g:NERDTreeShowLineNumbers=0 " 是否显示行号
let g:NERDTreeHidden=0     "不显示隐藏文件
""Making it prettier
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

"Plug 'hari-rangarajan/CCTree' 
let g:CCTreeSplitProgOption = '-l'

let Tlist_Auto_Open=0                                                                     
set tags=tags   
"设置是否自动切换目录：跟随打开文件
"set autochdir                                                                             
"只显示当前文件的tags
let Tlist_Enable_Fold_Column = 0
let Tlist_Show_One_File = 1                                                           
"设置taglist宽度
let Tlist_WinWidth=25
"taglist 窗口是最后一个窗口，则退出VIM
let Tlist_Exit_OnlyWindow=1
"在VIM窗口右侧显示taglist窗口 ,安ctr+ww 可切换窗口                                                            
let Tlist_Use_Right_Window=1

"设置fzf
nnoremap <leader>e :NERDTreeToggle<CR>
nnoremap <leader>d :NERDTreeFind<CR>
nnoremap <leader>f :Files<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>l :BLines<CR>
nnoremap <leader>u :FZFMru<CR>
nnoremap <leader>t :TagbarToggle<CR>

set tabstop=4
set shiftwidth=4
set expandtab
set autoindent

" set ag-vim ========================================
let g:ag_working_path_mode="r"
nmap <C-\>a :Ag <C-R>=expand("<cword>")<CR> <CR>

" plug gtags =======================
" 实际gtags安装的路径
" 执行gen后会在~/.cache/下面生成tags信息
" 1. 需要安装gtags下面的global软件包
" 2. 安装pygments
" 3. 配置参考：./configure --prefix=/home/wsk/bin/gtags --exec-prefix=/home/wsk/bin/gtags --datadir=/home/wsk/bin/gtags/data
"let g:gen_tags#gtags_default_map = 1
"let g:gen_tags#root_marker = ".repo"
"let $GTAGSCONF = '/home/wsk/bin/gtags/data/gtags/gtags.conf'
"let $GTAGSLABEL = 'pygments'

"Plug lspconfig ========================================
" 工作中常用的语言：
" C,MakeFile,Python,Lua,Json,Bash,MarkDown,Html
lua require('keybindings')
" clangd:C / pyright:Python / lua-language-server:lua
lua require('plugin-config/nvim-lspconfig') 
lua require('plugin-config/nvim-cmp')  
lua require('plugin-config/nvim-autopairs')  

"Plug Translate ========================================
nmap <silent> <Leader>w <Plug>TranslateW
vmap <silent> <Leader>w <Plug>TranslateWV

"Plug kanagawa =========================================
colorscheme kanagawa

"cscope     
set tags=tags       
if has("cscope")    
    set csto=1     
    set cst    
    if filereadable("cscope.out")    
        cs add cscope.out    
    endif    
endif    
    
nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>    
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>    
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>    
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>    
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>    
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>    
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

"vim-table-mode
"<leader>tm: disable/enable table mode
"<leader>tdd: 删除行
"<leader>tdc: 删除列
"<leader>tic: 插入列
"单元格移动:[|, ]|, {|, }|
