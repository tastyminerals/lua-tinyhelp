#!/usr/bin/env lua
-- Lua manual xml reader.

local luahelp = {}

require "pl"


-- identify user lua version
if _VERSION == "Lua 5.3" then
    fname = "lua_53.xml"
else if _VERSION == "Lua 5.2" then
    fname = "lua_52.xml"
else if _VERSION == "Lua 5.1" then
    fname = "lua_51.xml"
end

function _read(fname)
    local fhandle = io.open(fname, 'r')
    local data = fhandle:read("*a")
    fhandle:close()
    return data
end

function luahelp.help(query)
    root = xml.parse(_read(fname))
    -- handle about 
    if query == "about" then print(root[1][1]) return end
    
    -- search for query matches
    for item in root[2]:childtags() do
        -- search chapter match
        title = item.attr["title"]
        if (title:match(query)) then
            print(title)
            print(item[1])
        end
        -- search function match
        for initem in item:childtags() do
            name = initem.attr["name"]
            if (name:find(query) == 1) then
                print(name)
                print(initem[1])
            end
        end
    end
end

return luahelp
