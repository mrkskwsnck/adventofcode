-------------------------------------------------
--- Day 1: The Tyranny of the Rocket Equation ---
-------------------------------------------------

local Module = require "module"
local CounterUpper = require "counterupper"

local counterupper = CounterUpper:new()

local masses = io.open("masses.txt")
for mass in masses:lines() do
  local module  = Module:new(mass)
  counterupper:load(module)
end
masses:close()

io.write(counterupper:getfuelrequired(), "\n")
