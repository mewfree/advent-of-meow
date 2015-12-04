input = open('day-02.input', 'r')

def surface_math(l,w,h):
    sides = [2*l*w, 2*w*h, 2*h*l]
    return sum(sides)+min(sides)/2

def ribbon_math(l,w,h):
    inc = sorted([l,w,h])
    return 2*inc[0]+2*inc[1]+l*w*h

surface = 0
ribbon = 0

for line in input:
    values = line.rstrip().split('x')
    values = list(map(int, values))

    l = values[0]
    w = values[1]
    h = values[2]

    surface += surface_math(l,w,h)
    ribbon += ribbon_math(l,w,h)

print('Part 1:')
print(surface)

print('Part 2:')
print(ribbon)
