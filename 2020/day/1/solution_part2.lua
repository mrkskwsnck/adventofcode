#!/usr/bin/env lua5.3

function main ()
  local expenses = {}

  -- Built up expenses set
  local input = assert(io.open("input.txt", "r"))
  for number in input:lines("n") do
    table.insert(expenses, number)
  end
  input:close()

  local answer = 0

  -- Part 2
  for i = 1, #expenses do
    for j = 1, #expenses do
      for k = 1, #expenses do
        local left, middle, right = expenses[i], expenses[j], expenses[k]
        local sum = left + middle + right
        if sum == 2020 then
          io.write(string.format("%u + %u + %u = %u\n", left, middle, right, sum))
          local product = left * middle * right
          io.write(string.format("%u * %u * %u = %u\n", left, middle, right, product))
          answer = product
        end
      end
    end
  end

  local output = assert(io.open("answer_part2.txt", "w"))
  output:write(string.format("%u\n", answer))
  output:close()
end

main()
