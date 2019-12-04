-- HINT: Indexes in Lua arrays start with 1! However, this puzzle assumes
-- working with indizes starting with 0. Therefore the index is adapted at
-- specific key lines.

local M = {}

local function tointcode(progstr)
  local intcode = {}
  for int in progstr:gmatch("%d+") do
    table.insert(intcode, tonumber(int))
  end
  return intcode
end

function M:new (progstr)
  local t = {
    intcode = tointcode(progstr),
    pos = 1
  }
  self.__index = self
  setmetatable(t, self)
  return t
end

-- Smells like private method
function M:stepforward_ ()
  self.pos = self.pos + 1
  io.write(string.format("Set new position to %d\n", self.pos - 1))
end

function M:nextopcode ()
  local opcode = self.intcode[self.pos]
  io.write(string.format("Read opcode %d at position %d\n", opcode, self.pos - 1))
  self:stepforward_()
  return opcode
end

function M:nextval ()
  local pos = self.intcode[self.pos] + 1
  local val = self.intcode[pos]
  io.write(string.format("Read value %d at position %d\n", val, pos - 1))
  self:stepforward_()
  return val
end

function M:nextstore ()
  local pos = self.intcode[self.pos] + 1
  io.write(string.format("Read store position %d\n", pos - 1))
  self:stepforward_()
  return pos
end

function M:store (pos, val)
  io.write(string.format("Store %d at position %d\n", val, pos - 1))
  self.intcode[pos] = val
end

function M:tostring ()
  return table.concat(self.intcode, ",")
end

function M:restoregravityassist ()
  -- Restore the gravity assist program to the "1202 program alarm" state
  self.intcode[1 + 1] = 12  -- Replace position 1 with the value 12
  self.intcode[2 + 1] = 2   -- Replace position 2 with the value 2
end

return M
