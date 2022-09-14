noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-up> <C-W>+
noremap <C-down> <C-W>-
noremap <C-right> <C-W>>
noremap <C-left> <C-W><

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
