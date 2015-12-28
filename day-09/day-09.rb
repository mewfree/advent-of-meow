distances = Hash.new
cities = Array.new

def buildKey(origin_city, destination_city)
  return origin_city+':'+destination_city
end

def getDistance(hash, origin_city, destination_city)
  d = hash[buildKey(origin_city, destination_city)]
  # distances work both ways
  if !d
    d = hash[buildKey(destination_city, origin_city)]
  end
  # distances are converted to integers so we can do math on them
  return d.to_i
end

# populating data
File.readlines('day-09.input').each do |line|
  split = line.split(' ')
  distances[buildKey(split[0], split[2])] = split[4]
  cities.push(split[0], split[2])
end

# we only want each city once
cities = cities.uniq
# ruby's magic allows us to compute every permutation possible this way
permutations = cities.permutation(cities.length).to_a

path_lengths = Array.new
permutations.each do |permutation|
  path_length = 0
  for i in 0..permutation.length-2
    path_length = path_length + getDistance(distances, permutation[i], permutation[i+1])
  end
  path_lengths.push(path_length)
end

puts 'Part 1: '+path_lengths.min.to_s
puts 'Part 2: '+path_lengths.max.to_s
