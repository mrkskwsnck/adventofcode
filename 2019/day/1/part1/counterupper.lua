-- Class "CounterUpper"

local M = {}

function M:new ()
  local t = { fuel = 0 }
  self.__index = self
  setmetatable(t, self)
  return t
end

function M:getfuelrequired ()
  return self.fuel
end

function M:load (module)
  self.fuel = self.fuel + module:getfuelrequired()
end

return M
