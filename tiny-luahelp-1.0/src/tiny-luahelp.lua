#!/usr/bin/env lua
-- Lua docs xml reader.

local luahelp = {}

require "pl"


function _clean(text)
    -- replace xml special chars
    text = string.gsub(text, "&lt;", '<')
    text = string.gsub(text, "&gt;", '>')
    text = string.gsub(text, "&amp;", '&')
    return text
end

function _read()
    -- identify user lua version
    if _VERSION == "Lua 5.3" then
        fname = path.join("tiny_data","lua_53.xml")
    elseif _VERSION == "Lua 5.2" then
        fname = path.join("tiny_data","lua_52.xml")
    elseif _VERSION == "Lua 5.1" then
        fname = path.join("tiny_data","lua_51.xml")
    else
        fname = path.join("tiny_data","lua_53.xml")
    end
    local fhandle = io.open(fname, 'r')
    local data = fhandle:read("*a")
    fhandle:close()
    return data
end

function luahelp.help(query)
    root = xml.parse(_read())
    -- handle about 
    if query == "about" then print(root[1][1]) return end
    found = false 
    -- search for query matches
    for item in root[2]:childtags() do
        -- search chapter match
        title = item.attr["title"]
        if (title:match(query)) then
            print(title)
            print(_clean(item[1]))
            found = true
        end
        -- search function match
        for initem in item:childtags() do
            name = initem.attr["name"]
            if (name:find(query) == 1) then
                print(name)
                print(_clean(initem[1]))
                found = true
            end
        end
    end
    if not found then print("not found") end
end

-- luahelp.help(arg[1])

return luahelp
