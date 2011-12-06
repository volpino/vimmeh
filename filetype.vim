autocmd! FileType lisp,ruby,yaml,javascript,haml,scss Indentation 2
autocmd! FileType markdown,man,git,gitcommit,diff,mail,objdasm,pdf set nolist nonu
autocmd! FileType haml,scss set noexpandtab
autocmd! FileType haskell set expandtab

autocmd! BufRead,BufNewFile *.rbuild set ft=ruby
autocmd! BufRead,BufNewFile *.markdown set ft=markdown
autocmd! BufRead,BufNewFile *.yml set ft=yaml
autocmd! BufRead,BufNewFile *.asciidoc set ft=asciidoc
autocmd! BufRead,BufNewFile *.asd set ft=lisp

autocmd! BufRead,BufNewFile valgrind*.log set ft=valgrind

autocmd! BufReadCmd *.docx,*.xlsx,*.pptx call zip#Browse(expand("<amatch>"))
autocmd! BufReadCmd *.odt,*.ott,*.ods,*.ots,*.odp,*.otp,*.odg,*.otg call zip#Browse(expand("<amatch>"))
autocmd! BufReadPost *.pdf silent %!pdftotext -layout -nopgbrk "%" -

autocmd! BufRead,BufNewFile *.json set filetype=json
