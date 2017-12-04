#!/usr/bin/env lua

------------------------------
-- Inverse Captcha (Part 2) --
------------------------------

-- Halfway around the circular list
function next (list, start)
    -- List has an even number of elements
    local step = #list / 2
    local i = start

    for j = 1, step do
        i = i + 1
        
        -- Because it's a circular list
        if i > #list then
            i = 1
        end
    end

    return tonumber(list:sub(i, i))
end

for line in io.lines() do
    local _, _, captcha, result = line:find("(%d+)%s+(%d+)")
    local result = tonumber(result)
    local sum = 0

    for i = 1, #captcha do
        local current = tonumber(captcha:sub(i, i))
        local next = next(captcha, i)
        
        if current == next then
            sum = sum + current
        end
    end
    
    local matches = (sum == result)
    if matches then
        io.write(sum, "\n")
    else
        io.stderr:write(sum, "\n")
    end
end
