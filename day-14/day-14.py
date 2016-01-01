input = open('day-14.input', 'r')
race_length = 2503

reindeers = []
distances = []

class Reindeer:
    pass

for line in input:
    split = line.split(' ')

    reindeer = Reindeer()
    reindeer.name = split[0]
    reindeer.speed = int(split[3])
    reindeer.flying_time = int(split[6])
    reindeer.resting_time = int(split[13])

    reindeers.append(reindeer)

def race(reindeer, race_length):
    distance = 0
    while race_length > 0:
        if race_length > reindeer.flying_time:
            distance += reindeer.speed*reindeer.flying_time
            race_length -= reindeer.flying_time
        else:
            distance += reindeer.speed*race_length
            return distance

        race_length -= reindeer.resting_time

    return distance

for reindeer in reindeers:
    distances.append(race(reindeer, race_length))

print('Part 1:', max(distances))
