## Project Proposal

[Midpoint Report](https://mengjinyan.github.io/elixir/midpoint)

### Summary

We are going to implement a work scheduler library on top of hetrogeneous platforms with CPUs and GPUs. This scheduler will be integrated into [Scanner](https://github.com/scanner-research/scanner)[[^1]], a video analysis framework.

### Background

As nowadays the video consumers are becoming ubiquitous online, so is the need for a fast video analysis framework. The recent advances in machine learning methods enables many possibilities in this new area. Recent research by CMU on the [Scanner project](https://github.com/scanner-research/scanner)[[^1]] provides such a framework implemented using C++.

[TensorFlow](https://www.tensorflow.org/)[[^2]] is a open-source machine learning library which provides APIs in a lot of languages including Python, C++ and Go. The design and implementation of TensorFlow is similar to those of Scanner, and TensorFlow provides a much more complex work scheduler than that in Scanner, which enables the possibliity of implementing Scanner on top of Tensorflow.

Nevertheless, implementing Scanner as a whole on top of TensorFlow would require a lot of work and might introduce overhead from TensorFlow. Thus we plan to write a new lightweight work scheduler for Scanner. We plan to utilize the properties of the workload dependency DAGs and hetrogeneous hardware platforms to speedup the work on different video analysis applications implemented on top of Scanner, and improve the performance of the current work scheduler on Scanner.

### Challenges

The basic goal of Elixir is to take a pipeline specification of functions with different resource requirements such as CPU and GPU, and map the down to a machine with differnt CPUs and GPUs. This would introduce the following challenges:

1. Algorithms: one of the most important challenges we need to solve is to exploit the properties of the given DAG, to find out which parts of the workload pipeline is parallelizable.
2. Domain specific characteristics: we plan to optimize our scheduler for video analysis workflows, and it is difficult to and analyze some typical video analysis and extract some common key characteristics of the pipeline.
3. Stability: the workload is dynamic, and to predict and estimate the execution time of a specific piece of work is hard.
4. Resources: currently, there are not so many Scanner applications we can use to get the pipelines from.

### Resources

1. On the Scanner side of this project, the documentations and open-source code are listed online for our reference. The paper is provided to us to read, and as CMU students, we both can ask for help from the author of Scanner.
2. For the algorithms of the scheduler, since TensorFlow[[^2]] and Spark[[^3]] are popular open-source frameworks, third-party online information related to TensorFlow about it is plentiful. We can refer to the design of schedulers in both Spark and TensorFlow and introduce the key ideas into our implementation.

### Goals and Deliverables

#### Plan to achieve

The most important goal is to implement a working, fast work scheduler for Scanner. This would include:

1. The evaluation of the performance applications using the original Scanner scheduler as a baseline.
2. The scheduling algorithm. This is the core of our project.

#### Hope to achieve

The following tasks are those that we hope to achieve, if we are ahead of schedule.

1. Provide a set of interfaces for our scheduler, generalize it as a third-party library with a well-defined set of APIs.
2. A demo of running a real-time video analysis task if it is feasible.
3. Generalize and optimize our algorithm for different workflows other than those a video analysis application.

#### Evaluation

To evaluate Elixir, we will do a evaluation of the performance of several applications running on our scheduler and that in the original Scanner scheduler. We will provide graphs and charts for the speedup results.

If we are ahead of schedule, we will implement a simliar application on top of TensorFlow or Spark, and benchmark our implementation against that one.

### Platform

We will run our code on top of the platform on which Scanner is implemented. During the process, we plan to do our development and evaluation on the AWS platform.

It makes much sense to implement such a project on top of platforms which have hetrogeneous hardware including multiple CPU or CPU cores and high-end GPU(s).

### Schedule

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


 After 5/12 (What we hope to achieve, or before 5/12 if we finished everything earlier):

 - Application implementation on TensorFlow or Spark, benchmarking against our scheduler.
 - Real-time video analysis using a simple application such as face detection.

### References

[^1]: [The Scanner Project](https://github.com/scanner-research/scanner)

[^2]: Abadi, Martín, et al. "TensorFlow: A system for large-scale machine learning." Proceedings of the 12th USENIX Symposium on Operating Systems Design and Implementation (OSDI). Savannah, Georgia, USA. 2016.

[^3]: Zaharia, Matei, et al. "Spark: Cluster Computing with Working Sets." HotCloud 10.10-10 (2010): 95.
