from os import system

path = 'https://raw.githubusercontent.com/kdrag0n/base16-kitty/master/colors/'

for line in open('out.txt', 'r').readlines():
    name = line[:-1]
    cmd = path + name
    system('wget ' + cmd + ' ' + name)
