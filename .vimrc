""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => general settings

syntax on
filetype indent on
filetype plugin on

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set leaders
let mapleader=","
let maplocalleader="-"

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" html file settings

" indent html files when saved or read them
autocmd BufWritePre,BufRead *.html :normal gg=G

" add comment to html code
autocmd FileType html  nnoremap <buffer> <localleader>c 0i<!--<esc>$a-->

nnoremap <leader>ch :call Md2html()<cr>

function Md2html()

        let htmlout = expand('%:r').".html"
        let mdin=@%
        let htmltemp=@%.".html"
        "execute 'silent !markdown' mdin ">" htmltemp
        execute 'silent !pandoc --ascii --from=markdown --to=html ' mdin ">" htmltemp
        execute 'silent !cp' "template.html" htmlout
        execute 'silent !sed' "-i" "\"/here markdown/ r " .  htmltemp . '" ' .  htmlout
        execute 'silent !rm ' . htmltemp
        execute 'vsplit ' . htmlout

endfunction
 
""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Tabs settings

noremap <F2> :tabnext<cr>
noremap <F3> :tabprevious<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => pathogen

execute pathogen#infect()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-jedi
"
let g:jedi#force_py_version = 3

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" search settings
"

set hlsearch incsearch

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"c++
"set rtp+=/home/debian/tabnine-vim
