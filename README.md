# openmp

The rule of thumb is:
---------------------

* real < user: The process is CPU bound and takes advantage of parallel execution on multiple cores/CPUs.
* real ≈ user: The process is CPU bound and takes no advantage of parallel exeuction.
* real > user: The process is I/O bound. Execution on multiple cores would be of little to no advantage.

https://software.intel.com/en-us/articles/openmp-loop-scheduling

```
#pragma omp parallel for schedule(kind [,chunk size])
```

Four different loop scheduling types (kinds) can be provided to OpenMP, as shown in the following table. The optional parameter (chunk), when specified, must be a positive integer.

| Kind	  | Description |
| ------- | ----------- |
|static	  | Divide the loop into equal-sized chunks or as equal as possible in the case where the number of loop iterations is not evenly divisible by the number of threads multiplied by the chunk size. By default, chunk size is loop_count/number_of_threads.Set chunk to 1 to interleave the iterations. |
| dynamic | Use the internal work queue to give a chunk-sized block of loop iterations to each thread. When a thread is finished, it retrieves the next block of loop iterations from the top of the work queue. By default, the chunk size is 1. Be careful when using this scheduling type because of the extra overhead involved. |
| guided  | Similar to dynamic scheduling, but the chunk size starts off large and decreases to better handle load imbalance between iterations. The optional chunk parameter specifies them minimum size chunk to use. By default the chunk size is approximately loop_count/number_of_threads. |
| auto	  | When schedule (auto) is specified, the decision regarding scheduling is delegated to the compiler. The programmer gives the compiler the freedom to choose any possible mapping of iterations to threads in the team. |
| runtime | Uses the OMP_schedule environment variable to specify which one of the three loop-scheduling types should be used. OMP_SCHEDULE is a string formatted exactly the same as would appear on the parallel construct. |

