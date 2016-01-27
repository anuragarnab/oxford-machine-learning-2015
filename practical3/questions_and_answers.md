Simple example
==

By looking at a graph of the function, we can change the initialisation point and make it get stuck at local minima. For example, starting at x=5, makes it get stuck at a local optimum of about x=3.7. Starting at x=3 allows SGD to find one of the global minima, x = 0.05. Starting at x = -3, will find the other global minimum, x = -0.05

SGD
==

With batch-size = 2, and learning rate = 1e-1
0.02 epochs: Error = 40.48%
0.2 epochs: Error = 22.24%
2 epochs: Error = 17.64%

With batch-size = 32, and learning rate = 1e-1
0.02 epochs: Error = 
0.2 epochs: Error = 16.91%
2 epochs: Error = 13.69%
4 epochs: Error = 13.89% (This is why we should monitor the validation error, and "early stop" when we have the best validation error

Larger batch-size (32 vs 3) also executes much faster. This is probably because the vectorised instruction capabilities of the CPU is being used.

Now let us try some learning rate parameters, when using
batch-size = 32, 2 epochs
lr = 1   : 14.37%
lr = 1e-1: 13.69%
lr = 1e-2: 12.51%
lr = 1e-3: 14.02% -- maybe you need to run it for more epochs to get this to converge. But at the same time, I don't want to wait forever


Adagrad
==

With batch size = 32, 2 epochs
lr = 1e-1: 11.07%
