# vim-enhanced-resolver

<https://github.com/davidosomething/vim-enhanced-resolver>

Resolve import and require in JavaScript projects of all kinds.
This project depends on
[enhanced-resolve-cli](https://github.com/davidosomething/enhanced-resolve-cli)

## Installation

Using vim-plug:

```vim
Plug 'davidosomething/vim-enhanced-resolver', { 'do': 'npm install --global enhanced-resolve-cli' }
autocmd FileType javascript nmap <buffer> gf <Plug>(enhanced-resolver-go-cursor)
```

This maps your `gf` to try to resolve and edit module name under the current
vim `cWORD` (the `hyphen-word_theCursorIs./over`).

## How it works

`enhanced-resolve-cli` resolves the module relative to the file's directory.
It tries to find your webpack config (optional, doesn't need one) and resolves
the path using Webpack's
[enhanced-resolve](https://github.com/webpack/enhanced-resolve).

## License

MIT

