# openmp

The rule of thumb is:
---------------------

* real < user: The process is CPU bound and takes advantage of parallel execution on multiple cores/CPUs.
* real ≈ user: The process is CPU bound and takes no advantage of parallel exeuction.
* real > user: The process is I/O bound. Execution on multiple cores would be of little to no advantage.
