let s:cpo_save = &cpoptions
set cpoptions&vim

if !executable('enhancedresolve') | finish | endif

nmap <special>
      \ <Plug>(enhanced-resolver-echo-resolve)
      \ :echo enhancedresolver#Resolve()<CR>

nmap <special>
      \ <Plug>(enhanced-resolver-echo-cursor)
      \ :echo enhancedresolver#GetCursor()<CR>

nmap <silent><special>
      \ <Plug>(enhanced-resolver-go-cursor)
      \ :call enhancedresolver#ResolveAndGo()<CR>

let &cpoptions = s:cpo_save
unlet s:cpo_save
