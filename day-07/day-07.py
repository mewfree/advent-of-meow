import numpy as np

wires = {}

def can_int(s):
    try:
        int(s)
        return True
    except ValueError:
        return False

def work(str):
    str = str.rstrip()
    str = str.split(' ')

    if len(str) == 3:
        if can_int(str[0]) == True:
            wires[str[2]] = np.uint16(str[0])
        elif str[0] in wires:
            wires[str[2]] = np.uint16(wires[str[0]])
        else:
            return

    # if length is 4, it's a "NOT" bitwise op
    elif len(str) == 4:
        if str[1] in wires:
            wires[str[3]] = np.uint16(~wires[str[1]])
        else:
            return

    elif len(str) == 5:
        if str[0] in wires:
            if str[1] == 'RSHIFT':
                wires[str[4]] = np.uint16(wires[str[0]] >> int(str[2]))
            elif str[1] == 'LSHIFT':
                wires[str[4]] = np.uint16(wires[str[0]] << int(str[2]))
            else:
                if str[2] in wires:
                    if str[1] == 'AND':
                        wires[str[4]] = np.uint16(wires[str[0]] & wires[str[2]])
                    elif str[1] == 'OR':
                        wires[str[4]] = np.uint16(wires[str[0]] | wires[str[2]])
                    else:
                        return
                else:
                    return
        elif can_int(str[0]) and str[2] in wires:
                wires[str[4]] = np.uint16(int(str[0]) & wires[str[2]])
        else:
            return

# let's do it the iterative approach...
while True:
    input = open('day-07.input', 'r')
    for line in input:
        work(line)

    if 'a' in wires:
        signal_a = wires['a']
        print('Part 1:')
        print(signal_a)
        break

wires = {}

while True:
    input = open('day-07.input', 'r')
    wires['b'] = signal_a
    for line in input:
        if '-> b\n' not in line:
            work(line)

    if 'a' in wires:
        print('Part 2:')
        print(wires['a'])
        break
