#!/usr/bin/env lua

----------------------------------
-- Corruption Checksum (Part 2) --
----------------------------------

local sum = 0

for line in io.lines() do
    local start = 1
    local row = {} -- Positive integers only
    
    while true do
        local _, stop, match = line:find("(%d+)", start)

        if not match then
            break
        end

        table.insert(row, tonumber(match))
        table.sort(row, function(a, b) return a > b end) -- Reverse sort

        if start < #line then 
            start = stop + 1
        end
    end
    
    local div = 0
    for i = 1, #row do
        for j = #row, 1, -1 do
            -- Numbers shall not be equal
            if row[i] ~= row[j] and row[i] % row[j] == 0.0 then
                div = row[i] / row[j]
                io.write(div, "\n")
            end
        end
    end

    sum = sum + div
end

io.write("\n", sum, "\n")
