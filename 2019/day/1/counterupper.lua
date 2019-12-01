-- Class "CounterUpper"

local M = {}

function M:new ()
  local t = { fuelrequired = 0 }
  self.__index = self
  setmetatable(t, self)
  return t
end

function M:getfuelrequired ()
  return self.fuelrequired
end

function M:load (module)
  self.fuelrequired = self.fuelrequired + module:getfuelrequired()
end

return M
