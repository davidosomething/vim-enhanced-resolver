" Find a pair of quotes and get the thing in between them
"
" @return {String}
function! enhancedresolver#GetCursor() abort
  let l:word = match(getline('.'), '[''"].*[''"]') > -1
        \ ? substitute(getline('.'), '.*[''"]\(.*\)[''"].*', '\1', 'g')
        \ : ''
  return l:word
endfunction

" Get path to resolved module under cursor
"
" @return {String} path
function! enhancedresolver#Resolve() abort
  let l:request = enhancedresolver#GetCursor()
  let l:basepath = expand('%:p:h')
  let l:basepath = empty(l:basepath) ? getcwd() : l:basepath
  let l:webpackpath = empty(g:enhanced_resolver_webpack_config_path) ? 'webpack.config.js' : g:enhanced_resolver_webpack_config_path
  let l:result = substitute(system(join([
        \   'enhancedresolve',
        \   '--suppress',
        \   '--basepath', l:basepath,
        \   '--webpackConfig', l:webpackpath,
        \   l:request,
        \ ], ' ')), '\n', '', 'g')
  return l:result
endfunction

" Edit the path to resolved module under cursor
function! enhancedresolver#ResolveAndGo() abort
  let l:result = enhancedresolver#Resolve()
  if empty(l:result) || !filereadable(l:result) | return | endif
  silent! execute 'edit ' . l:result
endfunction
