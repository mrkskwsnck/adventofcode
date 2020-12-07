#!/usr/bin/env lua5.3

local input = assert(io.open("input.txt", "r"))
io.write(string.format("POLICY\tPASSWORD\tVALIDITY\n"))

local validity_counter = 0

for line in input:lines("l") do
  local _, _, policy, password = line:find("([^:]+):%s([^:]+)")
  io.write(string.format("%s\t%s", policy, password))

  local _, _, pos1, pos2, char = policy:find("(%d+)-(%d+)%s(%w)")
  pos1 = tonumber(pos1)
  pos2 = tonumber(pos2)
  
  char_at_pos1 = password:sub(pos1, pos1)
  char_at_pos2 = password:sub(pos2, pos2)

  if char_at_pos1 == char and char_at_pos2 ~= char
      or char_at_pos1 ~= char and char_at_pos2 == char then
    validity_counter = validity_counter + 1
    io.write(string.format("\t%s\n", true))
  else
    io.write(string.format("\t%s\n", false))
  end
end

input:close()

local output = assert(io.open("answer_part2.txt", "w"))
output:write(string.format("%u\n", validity_counter))
output:close()
