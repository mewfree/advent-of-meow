local md5 = require 'md5'
input = 'yzbqklnj'

print('Part 1:')
local i = 1
while true do
  hash = md5.sumhexa(input .. i)
  if string.sub(hash, 1, 5) == '00000' then
    print(i)
    break
  end
  i = i + 1
end

print('Part 2:')
local j = 1
while true do
  hash = md5.sumhexa(input .. j)
  if string.sub(hash, 1, 6) == '000000' then
    print(j)
    break
  end
  j = j + 1
end
