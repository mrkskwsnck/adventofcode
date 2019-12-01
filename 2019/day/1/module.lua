-- Class "Module"

local M = {}

function M:new (mass)
  local t = {}
  t.mass = mass
  self.__index = self
  setmetatable(t, self)
  return t
end

function M:getfuelrequired ()
  return math.floor(self.mass / 3) - 2
end

-- Humble unit testing
if not pcall(debug.getlocal, 4, 1) then
  local testset = {
    { mass = 12, fuelrequired = 2 },
    { mass = 14, fuelrequired = 2 },
    { mass = 1969, fuelrequired = 654 },
    { mass = 100756, fuelrequired = 33583 }
  }
  
  for _, test in pairs(testset) do
    local fuelrequired = M:new(test.mass):getfuelrequired()
    assert(fuelrequired == test.fuelrequired,
      string.format("Fuel required %d does not match expected value %d",
        fuelrequired, test.fuelrequired))
  end
end

return M
