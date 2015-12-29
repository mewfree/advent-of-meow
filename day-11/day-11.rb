input = 'vzbxkghb'

def has_three_straight(str)
  count = 0
  for i in 0..str.length-1
    if str[i+1] == str[i].next and str[i+2] == str[i+1].next
      count = count + 1
    end
  end

  if count > 0
    return true
  else
    return false
  end
end

def has_iol(str)
  if str.include? 'i' or str.include? 'o' or str.include? 'l'
    return true
  else
    return false
  end
end

def has_two_different_pairs(str)
  pairs = Array.new
  for i in 0..str.length-1
    if str[i] == str[i+1] and str[i] != str[i+2]
      pairs.push(str[i])
    end
  end
  if pairs.uniq.length >= 2
    return true
  end
  return false
end

count = 0
while true do
  # ruby's magic allows us to very simply increment a string
  input = input.next
  if has_three_straight(input) and !has_iol(input) and has_two_different_pairs(input)
    count = count + 1
    if count == 2
      puts 'Part 2: '+input
      break
    end
    puts 'Part 1: '+input
  end
end
