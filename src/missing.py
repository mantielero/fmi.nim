#!/usr/bin/env python
from pprint import pprint

def clean(lista):
    return [i[59:-1] for i in lista]


fp = open("original.txt","r")
orig = fp.readlines()
fp.close()

fp = open("nueva.txt","r")
new = fp.readlines()
fp.close()

orig = set(clean(orig))
new = set(clean(new))
print("MISSING IN THE NEW LIBRARY")
print("--------------------------")
pprint( orig - new )

print(f"Missing: {len(orig - new )} functions")
#print("MISSING IN THE ORIGINAL LIBRARY")
#print("-------------------------------")
#pprint( new - orig )

