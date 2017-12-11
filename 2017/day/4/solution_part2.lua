#!/usr/bin/env lua

------------------------------------------------
--- Day 4: High-Entropy Passphrases (Part 2) ---
------------------------------------------------

function charListFromString (s)
    local c = {}

    for i = 1, #s do
        c[i] = s:sub(i, i)
    end

    return c
end

function isanagram (s1, s2)
    local c1 = charListFromString(s1)
    local c2 = charListFromString(s2)

    table.sort(c1)
    table.sort(c2)

    if table.concat(c1, nil) == table.concat(c2, nil) then
        return true
    else
        return false
    end
end

local securecount = 0

for line in io.lines() do
    local wordset = {}
    
    for word in line:gmatch("%w+") do
        table.insert(wordset, word)
    end

    for i = 1, #wordset do
        for j = 1, #wordset do
            if i ~= j and isanagram(wordset[i], wordset[j]) then
                goto continue
            end
        end
    end

    -- Security is ensured
    securecount = securecount + 1

    ::continue::
end

io.write(securecount, "\n")
