Simple example
==

By looking at a graph of the function, we can change the initialisation point and make it get stuck at local minima. For example, starting at x=5, makes it get stuck at a local optimum of about x=3.7. Starting at x=3 allows SGD to find one of the global minima, x = 0.05. Starting at x = -3, will find the other global minimum, x = -0.05

SGD
==

With batch-size = 2, and learning rate = 1e-1
```
0.02 epochs: Error = 40.48%
0.2 epochs: Error = 22.24%
2 epochs: Error = 17.64%
```

With batch-size = 32, and learning rate = 1e-1
```
0.02 epochs: Error = 
0.2 epochs: Error = 16.91%
2 epochs: Error = 13.69%
4 epochs: Error = 13.89% (This is why we should monitor the validation error, and "early stop" when we have the best validation error
```

Larger batch-size (32 vs 3) also executes much faster. This is probably because the vectorised instruction capabilities of the CPU is being used.

Now let us try some learning rate parameters, when using
batch-size = 32, 2 epochs
```
lr = 1   : 14.37%
lr = 1e-1: 13.69%
lr = 1e-2: 12.51%
lr = 1e-3: 14.02% -- maybe you need to run it for more epochs to get this to converge. But at the same time, I don't want to wait forever
```

Now, let's try some mementum settings
lr = 1e-2, batch size = 64, 4 epochs

```
momentum = 0  : 11.46%
momentum = 0.8: 11.80%
momentum = 0.9: 11.03%
momentum = 0.99:18.34% (after 4 epochs), 12.58% after 8 epochs     
```

Adagrad
==

With batch size = 32, 2 epochs
lr = 1e-1: 11.07%

From now on, I am calculating the minimum test error.
```
lr = 1e-0: 9.88%  (and was exactly after 2 epochs of training)
lr = 1e-1: 10.72%
lr = 1e-2: 10.89%
```

L-BFGS
==
I am not really sure how this method works though

lr = 1e-1
```
Batch size = 32 : 23.23%
Batch size = 64 : 20.60%
```



Conclusions
==

Experiments could still be much more thorough

But, Adagrad seems to work better than SGD  
Adagrad seems to converge faster as well
Bigger batch sizes speed up training, and also give less noiser gradient updates which lead to better training  
Learning rate needs to be set carefully  
Didn't quite see evidence that momentum improves on standard SGD. However, a high momentum (0.99) made things worse. It could be that momentum is more useful for smaller batch sizes though. This should be tested at some point.  
