noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-up> <C-W>+
noremap <C-down> <C-W>-
noremap <C-right> <C-W>>
noremap <C-left> <C-W><


au FileType tex noremap j gj
au FileType tex noremap k gk
au FileType tex noremap $ g$
au FileType tex noremap 0 g0


" Surround
function! Surround()
    let sur = nr2char(getchar())
    if sur == "(" || sur == ")"
        exe "normal! gv\"sd\<Esc>i(\<Esc>\"spa)"
    elseif sur == "[" || sur == "]"
        exe "normal! gv\"sd\<Esc>i[\<Esc>\"spa]"
    elseif sur == "{" || sur == "}"
        exe "normal! gv\"sd\<Esc>i{\<Esc>\"spa}"
    else
        exe "normal! gv\"sd\<Esc>i" . sur . "\<esc>\"spa" . sur
    endif
endfunction

vnoremap s :call Surround()<CR>
