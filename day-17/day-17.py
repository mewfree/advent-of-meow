import itertools

input = open('day-17.input', 'r')

containers = []
eggnog = 150

for line in input:
    containers.append(int(line.rstrip()))

def sum150(list):
    count = 0
    for combination in list:
        if sum(combination) == 150:
            count += 1
    return count

count = 0
for length in range(1, len(containers)):
    count += sum150(list(itertools.combinations(containers, length)))

print(count)
