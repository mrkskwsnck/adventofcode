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
    { mass = 12, fuel = 2 },
    { mass = 14, fuel = 2 },
    { mass = 1969, fuel = 654 },
    { mass = 100756, fuel = 33583 }
  }
  
  for _, test in pairs(testset) do
    local fuel = M:new(test.mass):getfuelrequired()
    assert(fuel == test.fuel,
      string.format("Fuel required %d does not match expected value %d",
        fuel, test.fuel))
  end
end

return M
