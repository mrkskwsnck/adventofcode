#!/usr/bin/env lua

-- Inverse Captcha (Part 1)

for line in io.lines() do
    _, _, captcha, result = line:find("(%d+)%s+(%d+)")
    result = tonumber(result)
    sum = 0

    for i = 1, #captcha do
        current = tonumber(captcha:sub(i, i))
        next = tonumber(captcha:sub(i + 1, i + 1))

        -- Because it's a circular list
        if next == nil then
            next = tonumber(captcha:sub(1, 1))
        end

        if current == next then
            sum = sum + current
        end
    end

    matches = (sum == result)
    if matches then
        io.write(sum, "\n")
    else
        io.stderr:write(sum, "\n")
    end
end
