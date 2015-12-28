import re
input = open('day-08.input', 'r')

# cod = character of code
cod_total = 0
# cv = character value
cv_total = 0

def cod(str):
    return len(str)

def cv(str):
    if '\\\\' in str:
        str = str.replace('\\\\', 'w')
    if '\\"' in str:
        str = str.replace('\\"', 'w')
    if '\\x' in str:
        str = re.sub(r'(\\x.{2})', 'w', str)
    return len(str)-2

for line in input:
    str = line.rstrip()
    print(str)
    print(cod(str))
    print(cv(str))
    cod_total = cod_total + cod(str)
    cv_total = cv_total + cv(str)

print(cod_total-cv_total)
