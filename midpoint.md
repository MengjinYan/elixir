## Midpoint Report

[Project Proposal](https://mengjinyan.github.io/elixir)
### Progress Review
1. We used 4 days to build the Scanner project. This was way beyond our expectation. Our underestimation of the complexity of the Scanner project and the dependencies counts for most of the delay. A script was generated during this process which we can use in our future development.
2. We've come up with a basic framework for our scheduling algorithm. The basic idea is to have two priority queue (one for GPU jobs and one for CPU jobs) and put all jobs that can be executed into the queues. Each job is assigned a certain priority and each time we choose the job with the highest priority to execute on certain resources. We will model the pipeline into a DAG. Each node has the parameters of job type (CPU or GPU), depth in the graph, the number of child node, estimated computational cost with and without cache locality, etc. Each edge has the parameters of communication cost (between GPU and CPU or between different CPU/GPU). For each job in the queue, we plan to calculate the priority dynamically right before each scheduling action according to all the parameters in the graph as well as the batch number of the data frame and choose the job with the highest priority and put the job on certain resources.
3. The nice-to-haves are not in our plan for now. The new nice-to-have is to integrate our scheduler in Scanner without help from Alex.

### Goals & Deliverables

The most important deliverable is the scheduler itself, containing the algorithm and the library.

Because of the complexity of the Scanner project and Alex, the author of Scanner, will be traveling from May 1st till the the project is due, we currently have two paths to choose from, forward from this point:

1. Integrate the scheduler into Scanner, and to proceed along our original plan
2. Finish our scheduler, and instead of integrating our scheduler into Scanner, we're going to extract the kernels and the workflow pipelines out from the Surround360 application and run our scheduler on that application.

Which path to choose from would depend on the discussion tomorrow (4/26) with Alex.

So, what we would show at the parallelism competition would most likely be a comparison between the baseline performance and the performance of running the application on our scheduler. This would be either a demo, or in charts, depending on how long would the application run while demoing.

### Revised Schedule

| Time        | Work before this timestamp                                                                                               |
| :---------: | :-------------------                                                                                                     |
| 4/10        | Project Proposal (DONE)                                                                                                  |
| 4/13        | Investigate Scanner codebase and collect video analysis applications. (DONE)                                             |
| 4/25        | Basic design of the algorithms and scheduling policies are done. (DONE)                                                  |
| 4/26        | Discuss with Alex, make decision on the how to proceed with the baseline. (Tian and Mengjin)                             |
| 4/27        | Benchmark baseline of Surround360, reading Scanner and Surround360 code  (Tian and Mengjin)                              |
| 4/29        | Algorithm design and more paper reading (Mengjin); Design the general API of the scheduler (Tian)                        |
| 5/3         | First version of the Elixir scheduler implementation is done. Benchmark against the original Scanner. (Tian and Mengjin) |
| 5/7         | Different types of heuristics based optimizations are performed on the scheduler.                                        |
| 5/9         | The best result is achieved: all optimizations we can think of are performed.                                            |
| 5/12        | Documentation and Tutorials are done. Benchmarking and evaluations. Final Report.                                        |

### Issues & Concerns

1. The project depend on a lot of heuristics. There are a lot of parameters involved in this process, and to achieve the best results, we need to do a lot of iterations of parameter adjusting, which can take a long time. We might need better ways to deal with this issue.
2. The engineering side of this project could cost some time. Once Alex is gone, we would have no support for the Scanner side of our project. Integration of our scheduler and Scanner would cost a lot of time, which would require us to take the second path mentioned above.
