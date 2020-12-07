#!/usr/bin/env lua5.3

local input = assert(io.open("input.txt", "r"))
io.write(string.format("POLICY\tPASSWORD\tVALIDITY\n"))

local validity_counter = 0

for line in input:lines("l") do
  local _, _, policy, password = line:find("([^:]+):%s([^:]+)")
  io.write(string.format("%s\t%s", policy, password))

  local _, _, min, max, char = policy:find("(%d+)-(%d+)%s(%w)")
  min = tonumber(min)
  max = tonumber(max)
  
  local char_counter = 0

  for i = 1, #password do
    local c = password:sub(i, i)
    if c == char then
      char_counter = char_counter + 1
    end
  end

  if min <= char_counter and char_counter <= max then
    validity_counter = validity_counter + 1
    io.write(string.format("\t%s\n", true))
  else
    io.write(string.format("\t%s\n", false))
  end
end

input:close()

local output = assert(io.open("answer_part1.txt", "w"))
output:write(string.format("%u\n", validity_counter))
output:close()
