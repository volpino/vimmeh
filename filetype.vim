autocmd! FileType lisp,ruby,yaml,javascript,haml,scss Indentation 2
autocmd! FileType markdown,man,git,gitcommit,diff,mail,objdasm,pdf set nolist nonu
autocmd! FileType haml,scss set noexpandtab
autocmd! FileType haskell,lisp set expandtab

autocmd! BufRead,BufNewFile *.rbuild set ft=ruby
autocmd! BufRead,BufNewFile *.markdown set ft=markdown
autocmd! BufRead,BufNewFile *.yml set ft=yaml
autocmd! BufRead,BufNewFile *.asciidoc set ft=asciidoc
autocmd! BufRead,BufNewFile *.asd,*.cic set ft=lisp

autocmd! BufRead,BufNewFile valgrind*.log set ft=valgrind

autocmd! BufReadCmd *.docx,*.xlsx,*.pptx call zip#Browse(expand("<amatch>"))
autocmd! BufReadCmd *.odt,*.ott,*.ods,*.ots,*.odp,*.otp,*.odg,*.otg call zip#Browse(expand("<amatch>"))
autocmd! BufReadPost *.pdf silent %!pdftotext -layout -nopgbrk "%" -

autocmd! BufRead,BufNewFile *.json set filetype=json

autocmd! FileType c let g:SuperTabDefaultCompletionType = "<C-x><C-u>"

autocmd FileType c setlocal sw=4 sts=4 et
autocmd FileType css setlocal sw=4 sts=4 et
autocmd FileType eruby setlocal sw=2 sts=2 et
autocmd FileType htmlcheetah setlocal sw=2 sts=2 et
autocmd FileType html setlocal sw=2 sts=2 et
autocmd FileType xhtml setlocal sw=2 sts=2 et
autocmd FileType htmldjango setlocal sw=2 sts=2 et
autocmd FileType javascript setlocal sw=2 sts=2 et
autocmd FileType java setlocal sw=4 sts=4 et
autocmd FileType mason setlocal sw=2 sts=2 et
autocmd FileType ocaml setlocal sw=2 sts=2 et
autocmd FileType perl setlocal sw=4 sts=4 et
autocmd FileType php setlocal sw=4 sts=4 et
autocmd FileType python setlocal sw=4 sts=4 et tw=79
autocmd FileType ruby setlocal sw=2 sts=2 et
autocmd FileType scheme setlocal sw=2 sts=2 et
autocmd FileType sql setlocal et
autocmd FileType text setlocal sw=2 sts=2 et tw=79
