#!/usr/bin/env lua

------------------------------------------------------
--- Day 5: A Maze of Twisty Trampolines, All Alike ---
------------------------------------------------------

local ram = {}      -- The instruction set
local pointer = 1   -- Position to jump from
                    -- to the next instruction
local steps = 0     -- Step counter

function printram ()
    if arg[1] ~= "DEBUG" then
        return
    end

    for i = 1, #ram do
        if i == pointer then
            io.write(string.format("(%i)", ram[i]))
        else
            io.write(ram[i])
        end
        io.write(" ")
    end
    io.write("\b\n")
end

function jump ()
    local offset = ram[pointer]
    ram[pointer] = ram[pointer] + 1
    pointer = pointer + offset
    steps = steps + 1
end

-- Built up instruction set
for line in io.lines() do
    local n = tonumber(line)
    table.insert(ram, n)
end

printram()  -- Initial state

while pointer >= 1 and pointer <= #ram do
    jump()
    printram()
end

io.write(steps, "\n")   -- Steps taken to reach the exit
