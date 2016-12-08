package = "tiny-luahelp"
version = "1.0-1"
source = {
   url = "https://github.com/tastyminerals/tiny-luahelp/raw/master/tiny-luahelp-1.0.tar.gz",
   tag = "v1.0"
}
description = {
   summary = "Simple Lua docs reader available from interpreter.",
   detailed = [[
      Lua docs help system implementation. 
      Similar to help system used in Python interpreter.
   ]],
   homepage = "https://github.com/tastyminerals/tiny-luahelp",
   license = "MIT"
}
dependencies = {
   "lua >= 5.1, < 5.4",
   "penlight >= 0.8-1",
   "luafilesystem >=1.6.0-1"
}
build = {
   type = "builtin",
   modules = {
       luahelp = "src/tiny-luahelp.lua"
   },   
   copy_directories = {"tiny_data"}
}
