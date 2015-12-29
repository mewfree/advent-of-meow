input = 3113322113

def read(int)
  # actually stole that from Stack Overflow, so follow the link for more explanation:
  # http://stackoverflow.com/questions/9292338/ruby-split-string-by-repeating-characters-or-a-space
  int = int.to_s.scan(/((\d)\2*)/).map(&:first)

  def aloud(int, i)
    return int[i].length.to_s + int[i][0].to_s
  end

  r = ''
  for i in 0..int.length-1
    r = r + aloud(int, i)
  end

  return r
end

i = 0
until i == 40
  input = read(input)
  i = i + 1
end

puts 'Part 1:'
puts input.length

until i == 50
  input = read(input)
  i = i + 1
end

puts 'Part 2:'
puts input.length
