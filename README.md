```
  _ __ ___   __ _ _ __| | ____| |_   _ _ __ ___ | |__  ~
 | '_ ` _ \ / _` | '__| |/ / _` | | | | '_ ` _ \| '_ \ ~
 | | | | | | (_| | |  |   < (_| | |_| | | | | | | |_) |~
 |_| |_| |_|\__,_|_|  |_|\_\__,_|\__,_|_| |_| |_|_.__/ ~

```

## Introduction                       

The original name of this plugin should be "FlyDown". Writing on 
markdown should feel like literally flying down.

However, it's stupid to create one more plugin for dealing with 
markdown. But wait! Isn't it weird to a dirty vimrc just because 
of those edge corners?

Markdumb solves some "common sense's problems", but it also 
provides opinionated solutions to issues where the common sense 
probably wouldn't agree that there is one... Who needs to move 
quickly between tables on markdown?!

## Usage    

Markdumb is a filetype plugin and all of its functionality will
be available as soon as Vim recognizes that you are editing a
markdown file.

### Sections

Use:

* `]]` and `[[` to move to the next or previous header respectively.
* `][` and `[]` to move between links.
* `-[` and `[-` to move between tables.


### Header menu

You have an interactive menu, thanks to the Location List.

* `<leader>cx` will open the Location List populated with all
headers. 
* You can navigate the list with normal mode commands
as usual. 
* Press `<cr>` (enter) over a header to jump to it.
* Press `q` to close the location list.

Keep in mind that the Header Menu is meant to used with large
and unknown files. Most of the time `[[` and `]]` will be all
you need.


### FOLDING

Markdumb implements markdown folding as shared by Steve Losh in:
https://gist.github.com/sjl/1038710.

By default, the folds will be all opened when you first open a 
markdown file. Use normal Vim folding commands in order to 
manipulate them (see `:h fold-commands`).


## Mappings                               

On the previous section some mappings were featured in order to 
give a better insight on the Header Menu and the Sections.

Beside those, Markdumb implements a bunch of other small mapping 
that - not only might seen, but that - are opinionated. However, if
those dealing with large files or repetitive tasks might find them
somehow useful. 

### Creating links

* Insert markdown's link structure and place the cursor between 
the `[]`, directly from the insert mode:  `CTRL-f_f`

* Move to inside the next parenthesis with `<C-r>` waiting (so that 
you can pasta from the register of your choice), while still in 
insert mode. Can be used right after you're done with `CTRL_f-f`: `qq`.

* Manually make a visual selection with `b`, like `v3b`, then
 `<C-f>v` will surround the text with `[]` and place the cursor
 inside the `()` with `<C-r>` waiting for the register: `CTRL-f_v`

### Overwrite the next paragraph  

These commands are meant to be used when you are rewriting (or
translating a paragraph) on the fly. You write the new paragraph
above the old one (that will be used as a starting point). 

Once you're done with your new shining paragraph, use one of 
these to detelete the old one and leave you (and the cursor) on
the middle of the screan ('zz' normal mode command).

- `<c-f>k`	will do as mentioned above. 
- `<c-f>j`	the same, but will create an empty line above the next
paragraph. Useful if you intend to keep going with the task.

If you don't like those mappings, just change them to something else:

- `<c-f>k` is controlled by `g:NextParagraphN`:

```vim
    let g:NextParagraphN = 'kj'
```

- `<c-f>j` is controlled by `g:NextParagraphI`:

```vim
    let g:NextParagraphI = 'jk'
```

## Bugs                                       

Always. Just open an issue on github. (:

## TODO list

- [ ] Create clickable TOC
- [ ] Properly paste quotes


## Contributing                       

Really? Great! Open an issue on Github or just send a pull request.
o/


## Credits                               

Special thanks to http://stevelosh.com/ and his great:
http://learnvimscriptthehardway.stevelosh.com/

The Vim community for all available resources.

The Neovim community for keeping the thing breathing.

## License

MIT License

Copyright (c) 2017 - lsrdg

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.


