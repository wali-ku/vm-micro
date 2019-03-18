#!/usr/bin/env bash

jumps=(1 10 100 1000 10000 100000 1000000 10000000)

for jump in ${jumps[@]}; do
	for run in 1 2 3; do
		echo "[STATUS] Run: ${run} | Jumps: ${jump}"
		perf stat -o logs/rio/j${jump}_r${run}.perf ../dynamorio/build/bin64/drrun ./test ${jump}
	done
	echo
done
