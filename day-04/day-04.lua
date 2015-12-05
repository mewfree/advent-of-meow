local md5 = require 'md5'
input = 'yzbqklnj'

local i = 1
local done1 = false

while true do
  hash = md5.sumhexa(input .. i)
  if string.sub(hash, 1, 5) == '00000' and not done1 then done1 = true print('Part 1: ' .. i) end
  if string.sub(hash, 1, 6) == '000000' then print('Part 2: ' .. i) break end
  i = i + 1
end
