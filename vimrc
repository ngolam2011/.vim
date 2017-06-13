"pathogen plugin
execute pathogen#infect()

" filetype support
set nocompatible
filetype plugin indent on

" set hidden
set hidden

" set path for finding
set path+=**

"Gundo
nnoremap <F5> :GundoToggle<CR>

" database profile
let g:dbext_default_SQLSRV_bin="/opt/mssql-tools/bin/sqlcmd"
let g:dbext_default_profile_mySQLServer='type=SQLSRV:user=sa:passwd=P@ssword123:srvname=localhost:replace_title=1'
let g:dbext_default_profile='mySQLServer'
