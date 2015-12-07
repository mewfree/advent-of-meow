grid = []
grid2 = []

# populating the grids with 0's everywhere
for i in 0..999
  grid.push(Array.new(1000, 0))
  grid2.push(Array.new(1000, 0))
end

def interpret(string, grid)
  words = string.split(' ')
  if words.length == 4 # toggle
    bl = words[1]
    blx = bl.split(',')[0]
    bly = bl.split(',')[1]
    tr = words[3]
    trx = tr.split(',')[0]
    try = tr.split(',')[1]
    for i in blx.to_i..trx.to_i
      for j in bly.to_i..try.to_i
        if grid[i][j] == 0
          grid[i][j] = 1
        else
          grid[i][j] = 0
        end
      end
    end
  else
    bl = words[2]
    blx = bl.split(',')[0]
    bly = bl.split(',')[1]
    tr = words[4]
    trx = tr.split(',')[0]
    try = tr.split(',')[1]
    # turn on/off
    if words[1] == 'on'
      # turn on
      for i in blx.to_i..trx.to_i
        for j in bly.to_i..try.to_i
          grid[i][j] = 1
        end
      end
    else
      # turn off
      for i in blx.to_i..trx.to_i
        for j in bly.to_i..try.to_i
          grid[i][j] = 0
        end
      end
    end
  end
end

def interpret2(string, grid)
  words = string.split(' ')
  if words.length == 4 # toggle
    bl = words[1]
    blx = bl.split(',')[0]
    bly = bl.split(',')[1]
    tr = words[3]
    trx = tr.split(',')[0]
    try = tr.split(',')[1]
    for i in blx.to_i..trx.to_i
      for j in bly.to_i..try.to_i
        grid[i][j] = grid[i][j] + 2
      end
    end
  else
    bl = words[2]
    blx = bl.split(',')[0]
    bly = bl.split(',')[1]
    tr = words[4]
    trx = tr.split(',')[0]
    try = tr.split(',')[1]
    # turn on/off
    if words[1] == 'on'
      # turn on
      for i in blx.to_i..trx.to_i
        for j in bly.to_i..try.to_i
          grid[i][j] = grid[i][j] + 1
        end
      end
    else
      # turn off
      for i in blx.to_i..trx.to_i
        for j in bly.to_i..try.to_i
          grid[i][j] = grid[i][j] - 1
          if grid[i][j] < 0 
            grid[i][j] = 0
          end
        end
      end
    end
  end
end

def counter(grid)
  count = grid.flatten.inject(:+)
  return count
end

File.readlines('day-06.input').each do |line|
  interpret(line, grid)
  interpret2(line, grid2)
end

puts 'Part 1:'
puts counter(grid)

puts 'Part 2:'
puts counter(grid2)
