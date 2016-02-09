ticker = { "children" => 3,
           "cats" => 7,
           "samoyeds" => 2,
           "pomeranians" => 3,
           "akitas" => 0,
           "vizslas" => 0,
           "goldfish" => 5,
           "trees" => 3,
           "cars" => 2,
           "perfumes" => 1
         }

File.readlines('day-16.input').each do |line|
  fsplit = line.split(': ')
  suen = fsplit[0].split(' ')[1]
  fitem = fsplit[1]
  fitemn = fsplit[2].split(', ')[0]
  sitem = fsplit[2].split(', ')[1]
  sitemn = fsplit[3].split(', ')[0]
  titem = fsplit[3].split(', ')[1]
  titemn = fsplit[4]

  if ticker[fitem] == fitemn.to_i and ticker[sitem] == sitemn.to_i and ticker[titem] == titemn.to_i
    puts 'Part 1:'
    puts suen
  end
end
