#!/usr/bin/env python
import sys

preamble = '''\
/******************************************************************************
 * AUTOMATICALLY GENERATED FILE. DO NOT EDIT!!!
 * File:        %s
 * Purpose:     A simple program which can execute a user-specified number of
 *              indirect jump instructions
 *****************************************************************************/

#include <stdio.h>
#include <stdlib.h>

/* Total number of jump targets in the switch-case */
#define JUMP_TARGETS        (%d)

int main (int argc, void* argv [])
{
    if (argc != 2) {
        printf ("Usage: ./%s <num_of_jumps>\\n");
        return -1;
    }

    int num_of_jumps = atoi (argv [1]);
    int var_test = 0, var_control = 0, i = 0;
    volatile int target = 0;

    for (; i < num_of_jumps; ++i) {
        target = (rand () %% JUMP_TARGETS) + 1;
        var_control += target;

        switch (target) {
'''

switches = '''\
            case %d:
                var_test += target;
                break;

'''

epilogue = '''\
            default:
                printf ("[ERROR] Unexpected case\\n!");
                return -1;
        }

        if (var_control != var_test) {
            printf ("[ERROR] Mismatch found: control = %d | test = %d | Iteration = %d\\n", var_control, var_test, i);
            return -1;
        }
    }

    printf ("[STATUS] Successful Execution!\\n");
    return 0;
}
'''

def write_test (jump_targets):
    test_file = 'jumps.c'
    with open (test_file, 'w') as fdo:
        fdo.write (preamble % (test_file, jump_targets, test_file))

        for idx in xrange (1, jump_targets + 1):
            fdo.write (switches % idx)

        fdo.write (epilogue)

    return

def main ():
    jump_targets = int (sys.argv [1])
    write_test (jump_targets)

    return

if __name__ == '__main__':
    main ()
