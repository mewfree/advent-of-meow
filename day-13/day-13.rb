seatings = Hash.new
names = Array.new
sums = Array.new
sums2 = Array.new

def createKey(char1, char2)
  return char1+':'+char2
end

def totalPoints(seatings, position, perm)
  invitee = perm[position]
  neighbor1 = perm[position-perm.length+1]
  neighbor2 = perm[position-1]

  if invitee == 'Damien'
    return 0
  elsif neighbor1 == 'Damien'
    return seatings[createKey(invitee, neighbor2)]
  elsif neighbor2 == 'Damien'
    return seatings[createKey(invitee, neighbor1)]
  else
    return seatings[createKey(invitee, neighbor1)] + seatings[createKey(invitee, neighbor2)]
  end
end

File.readlines('day-13.input').each do |line|
  split = line.split(' ')
  char1 = split[0]
  points = split[3].to_i
  if split[2] == 'lose'
    points = points * -1
  end
  char2 = split[10].split('.')[0]

  seatings[createKey(char1, char2)] = points
  names.push(char1)
end

names = names.uniq
perms = names.permutation

perms.each do |perm|
  sum = 0
  for i in 0..perm.length-1
    sum += totalPoints(seatings, i, perm)
  end

  sums.push(sum)
end

puts 'Part 1: '+sums.max.to_s

names = names.push('Damien')
perms2 = names.permutation

perms2.each do |perm|
  sum = 0
  for i in 0..perm.length-1
    sum += totalPoints(seatings, i, perm)
  end

  sums2.push(sum)
end

puts 'Part 2: '+sums2.max.to_s
