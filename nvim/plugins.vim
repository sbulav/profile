" Auto install vim-plug
if has('nvim')
    if empty(glob($XDG_DATA_HOME.'/nvim/site/autoload/plug.vim'))
        silent !sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs
              \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    endif
    call plug#begin('~/.local/share/nvim/plugged')
endif

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plug)
" Interface
Plug 'myusuf3/numbers.vim'             " Intelligently toggle line numbers
Plug 'tpope/vim-commentary'            " Comment stuff in and out
Plug 'tpope/vim-eunuch'                " Integration with UNIX shell
Plug 'machakann/vim-sandwich'          " Surround objects with any character e.g. saiw|sdb|srb"
Plug 'justinmk/vim-sneak'              " Jump to location specified by two characters
Plug 'romainl/vim-qf'                  " Better work with quickfix
Plug 'mbbill/undotree'                 " Undotree
Plug 'junegunn/fzf.vim'                " Fuzzy finder
Plug 'junegunn/fzf'                    " Fzf wrapper

" Version Control Plugins
Plug 'airblade/vim-gitgutter'          " Git line status
Plug 'tpope/vim-fugitive'              " Git combine

" Languages
Plug 'elzr/vim-json'                   " Json syntax highlight
Plug 'glench/vim-jinja2-syntax'        " Jinja support for vim
Plug 'hashivim/vim-terraform'          " Terraform syntax highlight
Plug 'sbulav/vim-helm'                 " Helm syntax and compiler
Plug 'neovim/nvim-lspconfig'           " LSP templates and completions
Plug 'nvim-lua/completion-nvim'        " Async completions for nvim-lsp
Plug 'nvim-lua/diagnostic-nvim'        " Async diagnostincs for nvim-lsp
Plug 'Konfekt/vim-compilers'           " Set of vim compilers

" Code display
Plug 'lifepillar/vim-solarized8'

" Python
Plug 'nvie/vim-flake8'                 " Check code with flake8
Plug 'tmhedberg/SimpylFold'            " Python code folding
Plug 'Vimjas/vim-python-pep8-indent'   " PEP8 compliant indentation
Plug 'janko/vim-test'                  " Running tests

" Text objects
" Provided by vim-sandwitch              " TO closest pair of quotes of any type ib/ab
Plug 'jceb/vim-textobj-uri'              " TO URL                                iu/au
Plug 'kana/vim-textobj-entire'           " TO entire buffer                      ie/ae
Plug 'kana/vim-textobj-fold'             " TO folding                            iz/az
Plug 'kana/vim-textobj-function'         " TO function                           if/af
Plug 'kana/vim-textobj-indent'           " TO block of code based on indent      ii/ai
Plug 'kana/vim-textobj-line'             " TO line                               il/al
Plug 'kana/vim-textobj-user'             " Allow use of custom textobjects

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter'   " Smart text parsing
Plug 'nvim-treesitter/playground'        " Live treesitter information

call plug#end()