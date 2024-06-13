" runonce
if exists("b:did_ftplugin")
    finish
endif
let b:did_ftplugin = 1

autocmd BufNewFile,BufRead *.tt setf tt2
