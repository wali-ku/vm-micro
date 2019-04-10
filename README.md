# EECS-768: Indirect Jump Profiling Experiments
The purpose of this experiment is to measure the overhead of indirect jumps when an application is executed inside DynamoRio.

## Micor-Benchmark
A micro benchmark is written which contains a (large) switch-case statement inside a loop. Once compiled, 
the benchmark can be executed; taking the loop count (which should ideally be equal to the number of indirect jumps) as input.

```$ ./<benchmark_exec> <num_of_jumps>```

## Hypothesis
If the indirect jump processing incurs extraordinay overhead inside DynamoRio, then it should be observable through changing the
count of indirect jumps perfomed by the benchmark when it is executed inside DynamoRio.

## Strategy
  1. Execute benchmark directly on host machine with increasing loop count
  2. Repeat the same experiment inside DynamoRio
  
## Expected Outcome
The results from native host execution should tell us how the execution time of the benchmark should scale with increasing number
of instructions. The data from DynamoRio, if shows the same trend, can be taken to mean that indirect jump processing does not incur
extraordinary overhead inside DynamoRio. On the other hand, if the scaling factor of execution time inside DynamoRio is much larger, it would prove the converse.

## Generating the Benchmark
The python script can be used to control the number of cases of the switch-case statement in the micro-benchmark.

``` ./analyze.py <num_of_cases> ```

This would create the benchmark file **jumps.c** in the current directory. This file should be compiled with gcc and used as micro-benchmark.

The size of the switch-case statement should be large enough to create indirect jumps in each iteration of the loop. (Confirmed with Disassembly)
