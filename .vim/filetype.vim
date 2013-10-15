au BufRead,BufNewFile /etc/nginx/* set ft=nginx
au BufRead,BufNewFile *.less set ft=less
au BufRead,BufNewFile *.ejs set ft=jst

au BufNewFile,BufReadPost,FilterReadPost,FileReadPost,Syntax * SpaceHi
au FileType help NoSpaceHi
