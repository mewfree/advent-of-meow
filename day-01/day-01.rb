input = File.read('day-01.input')

puts 'Part 1:'
puts input.count('(')-input.count(')')

puts 'Part 2:'
i = 0
floor = 0
until floor < 0
  if input[i] == '('
    floor = floor + 1
  else input[i] == ')'
    floor = floor - 1
  end
  i = i + 1
end
puts i
