# lua-tinyhelp
Lua does not have a build-in help system. This is a simple lua docs reader that you can use inside and outside Lua interactive shell.
Similar to Python interactive shell help function.

![](http://i.imgur.com/8G8zLYz.png)


### INSTALL

To use the script **outside** of Lua interpreter.

- Download `lua-tinyhelp.lua`
- Put it in `/usr/local/bin`
- Download xml files from `help` dir
- Put them in `~/.lua-tinyhelp/`


To use in **Lua interpreter**.

- Put everything into `~/.lua-tinyhelp/`
- Add to your **~/.bashrc** the following `LUA_PATH="$LUA_PATH;/home/$USER/.lua-tinyhelp/?.lua"`
- In Lua interpreter do:

```
h = require("lua-tinyhelp")
help = h.help
```

Now you can use `help` function as `help("YOUR QUERY")`:


![](http://i.imgur.com/rZQ8gMu.png)
