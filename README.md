# lua-tinyhelp
Simple lua docs reader that you can use inside and outside Lua interactive shell.
Similar to Python interactive shell help function.





### INSTALL

To use the script **outside** of the Lua shell.

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

Now you can use `help` function as:





