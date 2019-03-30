import sys
import re

# question 1
print("\nquestion 1")
for temp in input().split(" "):
  print(chr(int(temp, 2)), end="")

# question 2
print("\nquestion 2")
for temp in re.split('(..)', input())[1::2]:
  print(chr(int(temp, 16)), end="")

# question 3
print("\nquestion 3")
for temp in input().split(" "):
  print(chr(int(temp, 8)), end="")
