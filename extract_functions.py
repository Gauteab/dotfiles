import re
import fileinput
import os
from sys import argv

def write(result):
    print("writing results")
    with open(os.path.expanduser("~/.names"), "w") as file:
        for name in result:
            file.write(name)
            file.write("\n")

def get_configuration(name):
    if name == "elm":
        r = r"(\w+).*="
        reserved = "type alias".split()
    elif name == "py":
        r = r"def (\w+)|(\w+)\s*=|import\s+(\w+)"
        reserved = []
    else:
        raise Exception(f"Invalues name: {name}")
    return (r, reserved)

def main():
    (r, reserved) = get_configuration(argv[1])
    path = argv[2]
    assert path.endswith(argv[1])
    with open(path) as f:
        result = re.findall(r, f.read())
        result = ["".join(t) for t in result]
        result = set(filter(lambda x: not x in reserved, result))
        write(result)

if __name__ == "__main__":
    main()
