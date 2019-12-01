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
  local currentmass = self.mass
  local totalfuel = 0
  
  repeat
    currentfuel = math.floor(currentmass / 3) - 2
    if currentfuel < 0 then
      currentfuel = 0
    end
    totalfuel = totalfuel + currentfuel
    currentmass = currentfuel
  until currentmass <= 0
  
  return totalfuel
end

-- Humble unit testing
if not pcall(debug.getlocal, 4, 1) then
  local testset = {
    { mass = 12, fuel = 2 },
    { mass = 14, fuel = 2 },
    { mass = 1969, fuel = 966 },
    { mass = 100756, fuel = 50346 }
  }
  
  for _, test in pairs(testset) do
    local fuel = M:new(test.mass):getfuelrequired()
    assert(fuel == test.fuel,
      string.format("Fuel required %d does not match expected value %d",
        fuel, test.fuel))
  end
end

return M
