#!/usr/bin/env lua5.3

local program = require "program"

function main ()
  local file = assert(io.open("program.txt", "r"))
  local progstr = file:read("l")
  file:close()

  local p = program:new(progstr)
  p:restoregravityassist()
  io.write(string.format("Input: %s\n", p:tostring()))
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
  
  io.write(string.format("Output: %s\n", p:tostring()))
  io.write("\n")
end

main()
