#!/usr/bin/env lua

----------------------------------
-- Corruption Checksum (Part 1) --
----------------------------------

local sum = 0

for line in io.lines() do
    local start = 1
    local min, max  -- Positive integer only
    
    while true do
        local _, stop, match = line:find("(%d+)", start)

        if not match then
            break
        end

        local number = tonumber(match)
        
        if not min or number < min then
            min = number
        end

        if not max or number > max then
            max = number
        end

        if start < #line then 
            start = stop + 1
        end
    end
    
    local diff = max - min
    io.write(diff, "\n")

    sum = sum + diff
end

io.write("\n", sum, "\n")
