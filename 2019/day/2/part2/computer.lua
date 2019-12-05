#!/usr/bin/env lua5.3

---------------------------------
--- Day 2: 1202 Program Alarm ---
---------------------------------

local program = require "program"

function run (p, noun, verb)
  p:restoregravityassist(noun, verb)
  local opcode = p:nextopcode()
  
  while opcode ~= 99 do
    if opcode == 1 then
      local operand1 = p:nextval()
      local operand2 = p:nextval()
      local sum = operand1 + operand2
      local pos = p:nextstore()
      p:store(pos, sum)
    elseif opcode == 2 then
      local operand1 = p:nextval()
      local operand2 = p:nextval()
      local prod = operand1 * operand2
      local pos = p:nextstore()
      p:store(pos, prod)
    end
    
    opcode = p:nextopcode()
  end
  
  return p:getresult()
end

function main ()
  local file = assert(io.open("program.txt", "r"))
  local progstr = file:read("l")
  file:close()
  
  for noun = 0, 99 do
    for verb = 0, 99 do
      local p = program:new(progstr)
      local result = run(p, noun, verb)
      
      -- Puzzle part 2
      if result == 19690720 then
        local answer = 100 * noun + verb
        io.write(string.format("%d\n", answer))
      end
    end
  end
end

main()
