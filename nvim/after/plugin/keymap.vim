" Key mappings
"""""""""""""""""""

" Set leader to space
let mapleader=" "
map <Space> <Leader>

augroup pscbindings
  autocmd!
  autocmd FileType yaml nnoremap <buffer> <F5> :Nredir !kubectl apply --dry-run -o yaml -f %<cr>
  autocmd FileType yaml nnoremap <buffer> <F6> :Nredir !kubectl apply -f %<cr>
  autocmd FileType helm nnoremap <buffer> <F5> :Nredir !helm install . --dry-run --debug --generate-name <cr>
  autocmd FileType helm nnoremap <buffer> <F6> :Nredir !helm template . <cr>
  " autocmd FileType python nnoremap <buffer> <F5> :Nredir !pytest --kube-config=$KUBECONFIG<cr>
  autocmd FileType python nnoremap <buffer> <F5> :Nredir !python %<cr>
  autocmd FileType terraform nnoremap <buffer> <F5> :Nredir !terraform plan -no-color<cr>
  autocmd FileType terraform nnoremap <buffer> <F6> :Nredir !terraform apply --auto-approve<cr>
  autocmd FileType typescript nnoremap <buffer> <F5> :Nredir !npm run build && npm run test && npm run lint<cr>
augroup end

" Draw a visual line in any mode on F1
inoremap <silent> <F1> <ESC>:execute "set colorcolumn=" . (&colorcolumn == "" ? "81" : "")<CR>a
nnoremap <silent> <F1> :execute "set colorcolumn=" . (&colorcolumn == "" ? "81" : "")<CR>
vnoremap <F1> <ESC>

" Paste mode on F2
set pastetoggle=<F2>

" Use netrw as file Explorer
" Moved to LUA
" map <silent> <F3> :call ToggleVExplorer()<CR>

" Show/unshow Numbers on F4
nnoremap <F4> :set relativenumber!<CR>

" Check spelling on F6
nmap <F6> :set spell!<CR>

" Show TS Playground
nnoremap <F8> :TSPlaygroundToggle<CR>
" Show lsp log
nnoremap <F9> :lua require'nredir'.nredir("!tail -100 " .. vim.lsp.get_log_path())<cr>

" Show lsp status
nnoremap <F10> :lua print(vim.inspect(vim.lsp.buf_get_clients()))<cr>

" Stop all lsp clients
nnoremap <F12> :lua vim.lsp.stop_client(vim.lsp.get_active_clients())<cr>

" Space toggle fold
" nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
" vnoremap <Space> zf

" Reset searchhighlight
nnoremap <silent>zz :nohlsearch<cr>z.

" Enable folding with the spacebar
"nnoremap <space> za

" Indent, keep selected text
vmap < <gv
vmap > >gv

" Move visual selection up/down in visual mode
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Delete current visual selection to blackhole buffer and paste from clipboard
vnoremap <leader>p "_dP

" Show Hop on with easy move
nnoremap <silent> zx :HopWord<cr>
vnoremap <silent> zx :HopWord<cr>

" Bindings that came from Eunich
" :Delete: Delete a buffer and the file on disk simultaneously.
" :Move: Rename a buffer and the file on disk simultaneously.
" :Rename: Like :Move, but relative to the current file's containing directory.
" :Chmod: Change the permissions of the current file.
" :Mkdir: Create a directory, defaulting to the parent of the current file.
" :SudoWrite: Write a privileged file with sudo.
" :SudoEdit: Edit a privileged file with sudo.

" Useful ones in insert mode, see :h index
" <c-r> - insert text from register
" <c-a> - last inserted text
" <c-w> - delete one word before cursorc
" <c-o> - execute one normal command and return to insert mode

" ----------------------------------------------------------------------------
" Quickfix
" ----------------------------------------------------------------------------
nnoremap ]q :cnext<cr>zz        " Quickfix next
nnoremap [q :cprev<cr>zz        " Quickfix previous
nnoremap ]Q :cnewer<cr>zz       " Open newer quickfix results
nnoremap [Q :colder<cr>zz       " Open older quickfix results
nnoremap ]l :lnext<cr>zz        " Location next
nnoremap [l :lprev<cr>zz        " Location previous
nmap <silent> <leader>l :call ToggleList("Location List", 'l')<CR> " Open/Close location
nmap <silent> <leader>q :call ToggleList("Quickfix List", 'c')<CR> " Open/Close quickfix

" ----------------------------------------------------------------------------
" Buffers
" ----------------------------------------------------------------------------
nnoremap ]b :bnext<cr>
nnoremap [b :bprev<cr>

" ----------------------------------------------------------------------------
" Tabs
" ----------------------------------------------------------------------------
nnoremap ]t :tabn<cr>
nnoremap [t :tabp<cr>

" ----------------------------------------------------------------------------
" Jumps
" ----------------------------------------------------------------------------
nnoremap ]j <c-i>
nnoremap [j <c-o>
" ----------------------------------------------------------------------------
" <tab> / <s-tab> | Circular windows navigation
" ----------------------------------------------------------------------------
nnoremap <tab>   <c-w>w
nnoremap <S-tab> <c-w>W

" ----------------------------------------------------------------------------
" Managing files with shortcuts, leader mapped to <SPACE>
" ----------------------------------------------------------------------------
" Close any window with one small shortcut
nnoremap Q :quit<cr>

" Add files with wildcards in CWD, like *.md
nnoremap <leader>a :argadd <C-R>=fnameescape(expand('%:p:h'))<cr>/*<C-d>

" Add files with wildcards in subfolders, like *.md
nnoremap <leader>A :argadd <C-R>=fnameescape(expand('%:p:h')).'/**/*'<CR>

" Telescope
" <c-x>,<c-v> open in split/vsplit, <c-u>,<c-d> up/down preview
nnoremap <leader>fM <cmd>lua require('telescope.builtin').marks()<cr>
nnoremap <leader>fa <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fc <cmd>lua require('telescope.builtin').git_commits()<cr>
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').oldfiles()<cr>
nnoremap <leader>fm <cmd>lua require('telescope.builtin').keymaps()<cr>
nnoremap <leader>fe <cmd>lua require('telescope.builtin').registers()<cr>
nnoremap <leader>fs <cmd>lua require('telescope.builtin').git_files()<cr>
nnoremap <leader>ft <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>fv <cmd>lua require('_telescope.myfunctions').search_vimfiles()<cr>
nnoremap <leader>fd <cmd>lua require('_telescope.myfunctions').search_vimfiles()<cr>
nnoremap <leader>fp <cmd>lua require'telescope'.extensions.project.project{ change_dir = true }<cr>
nnoremap <leader>fr <cmd>lua require'telescope'.extensions.gh.run{}<cr>

" Populate quickfix with current buffers with <c-q><c-q>
nnoremap <C-q> :lua require('telescope.builtin').buffers()<Cr>

" Quickly go to custom Grep
" nnoremap <leader>g :Grep<space>

" GIT - add all modified files to staging
nnoremap <leader>ga :Git add .<cr>
" GIT - run Gdiffsplit against current file and HEAD
nnoremap <leader>gd :Gdiffsplit<cr>
" GIT - change directory to git root
nnoremap <leader>G :Gcd<cr>
" GIT - Invoke Fugitive's
nnoremap <leader>g :Git<cr>
" GIT - create fixup commit and push it
nnoremap <leader><leader>g :!git add . && git commit -m "fixup" && gpo<cr>

" Simply run a make command
nnoremap <leader>m :make<cr>
" Run a function to strip trailing whitespaces
nnoremap <leader>s :call StripTrailingWhitespace()<cr>
" Switch to last edited buffer
nnoremap <leader>le :b#<cr>
" Close current buffer
nnoremap <leader>d :bdelete<cr>
nnoremap <leader>D :bdelete!<cr>
" Undotree
nnoremap <leader>u :UndotreeToggle<cr>
" Reload vim config
" nnoremap <leader>r :source $MYVIMRC<CR>
nnoremap <leader>r :lua require("plenary.reload").reload_module'$MYVIMRC'<cr> :luafile $MYVIMRC<cr>
" Use Nredir function to open vim command in split
nnoremap <leader>R :Nredir <c-f>A
" Open vimrc
nnoremap <leader>rc :edit $MYVIMRC<CR>
" Global replace word under cursor
nnoremap <leader>% :%s/\<<C-r>=expand('<cword>')<CR>\>/
" Change project folder to current file's directory for current window
nnoremap <leader>c :lcd %:p:h<cr>
" Close all buffers except currnent one
nnoremap <leader>o :w <bar> %bd <bar> e# <bar> bd# <CR>
" Open terminal
nnoremap <leader>tO :terminal<cr>A
" Exit terminal insert mode
if has("nvim")
  au TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
endif
" Open command window on ;
nnoremap ; q:A
" Escape works in command window
autocmd CmdwinEnter * nnoremap <buffer> <Esc> <C-c>
" Execute this file
function! s:save_and_exec() abort
  if &filetype == 'vim'
    :silent! write
    :source %
  elseif &filetype == 'lua'
    :silent! write
    :lua require("plenary.reload").reload_module'%'
    :luafile %
  endif

  return
endfunction

" Save and resource current file
nnoremap <leader><leader>x :call <SID>save_and_exec()<CR>
" Call completion
inoremap <silent><expr> <c-space> completion#trigger_completion()

" vim-test mappings
nmap <silent> <leader>tn :TestNearest<CR>
nmap <silent> <leader>tf :TestFile<CR>
nmap <silent> <leader>ts :TestSuite<CR>
nmap <silent> <leader>tl :TestLast<CR>
nmap <silent> <leader>tv :TestVisit<CR>Folding

" vim-sneak mappings
map f <Plug>Sneak_s
map F <Plug>Sneak_S
map t <Plug>Sneak_t
map T <Plug>Sneak_T

" Easier Moving between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Make windows to be basically the same size
nnoremap <leader>= <C-w>=

" Sizing window horizontally
nnoremap <A-l> <C-W>10<
nnoremap <A-h> <C-W>10>

" Sizing window vertically
" taller
nnoremap <A-j> <C-W>10+
" shorter
nnoremap <A-k> <C-W>10-
