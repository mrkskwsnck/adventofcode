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
end

function M:nextopcode ()
  local opcode = self.intcode[self.pos]
  self:stepforward_()
  return opcode
end

function M:nextval ()
  local pos = self.intcode[self.pos] + 1
  local val = self.intcode[pos]
  self:stepforward_()
  return val
end

function M:nextstore ()
  local pos = self.intcode[self.pos] + 1
  self:stepforward_()
  return pos
end

function M:store (pos, val)
  self.intcode[pos] = val
end

function M:tostring ()
  return table.concat(self.intcode, ",")
end

function M:restoregravityassist (noun, verb)
  self.intcode[1 + 1] = noun  -- Replace position 1 with the noun
  self.intcode[2 + 1] = verb  -- Replace position 2 with the verb
end

function M:getresult()
  return self.intcode[1]
end

return M
