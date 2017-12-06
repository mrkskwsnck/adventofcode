#!/usr/bin/env lua

------------------------------------------------
--- Day 4: High-Entropy Passphrases (Part 1) ---
------------------------------------------------

function tablesize (t)
    local i = 0

    for k in pairs(t) do
        if t[k] then
            i = i + 1
        end
    end

    return i
end

local securecount = 0

for line in io.lines() do
    local wordset = {}
    local wordcount = 0

    for word in line:gmatch("%w+") do
        wordset[word] = true
        wordcount = wordcount + 1
    end

    if tablesize(wordset) == wordcount then
        -- Security is ensured
        securecount = securecount + 1
    end
end

io.write(securecount, "\n")
