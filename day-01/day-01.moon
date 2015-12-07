file = io.open('day-01.input', 'r')
content = file\read('*all')

count = 0
for char in string.gmatch(content, '%S')
  if char == '('
    count += 1
  else
    count -= 1

print 'Part 1:'
print count

count = 0
i = 0
for char in string.gmatch(content, '%S')
  i += 1
  if char == '('
    count += 1
  else
    count -= 1
  if count < 0
    break
      
print 'Part 2:'
print i
