input = open('day-05.input', 'r')

def has3vowels(str):
    str = str.translate(None, 'bcdfghjlmnpqrstvwxyzk')
    if len(str) >= 3:
        return True
    else:
        return False

def twiceinarow(str):
    prev = ''
    for letter in str:
        if letter == prev:
            return True
        prev = letter

# dncbs: does not contain bad strings
def dncbs(str):
    badstrings = ['ab', 'cd', 'pq', 'xy']
    if any(badstring in str for badstring in badstrings):
        return False
    else:
        return True

def twoletterspair(str):
    pairs = []
    for i in range(0, len(str)-1):
        pairs.append(str[i:i+2])
    if len(pairs) > len(set(pairs)):
        for i in range(0, len(pairs)-1):
            if pairs[i] == pairs[i+1]:
                if pairs[i] == pairs[i+2]:
                    return True
                else:
                    return False
            elif i == len(pairs)-2:
                return True
            else:
                continue
    else:
        return False

def repeatwithbetween(str):
    for i, letter in enumerate(str):
        if i < len(str)-2:
            if letter == str[i+2]:
                return True
            else:
                continue
        else:
            return False

nice_strings = 0
nice_strings2 = 0

for line in input:
    string = line.rstrip()
    if has3vowels(string) and dncbs(string) and twiceinarow(string):
        nice_strings += 1
    if twoletterspair(string) and repeatwithbetween(string):
        nice_strings2 += 1

print('Part 1:')
print(nice_strings)

print('Part 2:')
print(nice_strings2)
