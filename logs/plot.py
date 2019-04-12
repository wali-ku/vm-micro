#!/usr/bin/env python

import os
import sys

jump_vals = [1, 10, 100, 1000, 10000, 100000, 1000000, 10000000]

native_values = []
rio_values = []
for j in jump_vals:
    nat = open('native/j{}_r3.perf'.format(j))
    lines = [line for line in nat.readlines() if line.strip()]
    nat.close()
    native_values.append(lines[2].strip().split(' ')[0])

    rio = open('rio/j{}_r3.perf'.format(j))
    lines = [line for line in rio.readlines() if line.strip()]
    rio.close()
    rio_values.append(lines[2].strip().split(' ')[0])

native_dat = open('native.dat', 'wb')
for i,v in enumerate(native_values):
    native_dat.write('"{}"    {:0.2f}\n'.format(jump_vals[i], float(v)))
native_dat.close()

rio_dat = open('rio.dat', 'wb')
for i,v in enumerate(rio_values):
    rio_dat.write('"{}"    {:0.2f}\n'.format(jump_vals[i], float(v)))
rio_dat.close()

os.system("gnuplot gen.gp")

#Test code for finding average indirect jump overhead
'''
print "Average indirect jump overheads:"
for i,j in enumerate(jump_vals):
    average = (float(rio_values[i]) - float(native_values[i])) / j
    print "\t{}: {}".format(i, average)
'''
