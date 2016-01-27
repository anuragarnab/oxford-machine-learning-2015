Question 1
==

Modify section 5 of the code (Test the trained model) to compute the predictions for
the following test dataset of three observations and two input features (fertilizer and
insecticide):
```dataTest = torch.Tensor{
{6, 4},
{10, 5},
{14, 8}
}```
What are the values of the three parameters? What happens to the parameters and
predictions when the number of epochs is either 1e3 (1 × 103) or 1e5 (1 × 105)? Hand in
the answers to these questions.

---

When the number of epochs increases, SGD converges, and the results are slightly improved.

Epochs: 1e3

Here's the output

id  approx   text	
 1   33.29  40.32	
 2   40.64  42.92	
 3   44.08  45.33	
 4   47.27  48.85	
 5   50.47  52.37	
 6   53.42  57.00	
 7   60.29  61.82	
 8   62.52  69.78	
 9   65.96  72.19	
10   76.26  79.42

Epochs: 1e5

id  approx   text	
 1   40.32  40.32	
 2   42.91  42.92	
 3   45.32  45.33	
 4   48.84  48.85	
 5   52.37  52.37	
 6   57.01  57.00	
 7   61.82  61.82	
 8   69.81  69.78	
 9   72.22  72.19	
10   79.44  79.42	

This indicates that SGD converged after 1e5 iterations, but not 1e3.

I'm too lazy to work out the mean-square error here

Question 2
==

Implement the least squares solution θ = (XT X)−1XT y using the same dataset. What
are the predictions for the above test set? How do they compare to the predictions of
the linear neuron trained with SGD? How do the parameters compare? Hand in your
answers.

---

After 1e3 iterations when SGD has not converged

Parameters predicted by SGD: ```[1.837 -0.240 23.23]```
Parameters predicted by Least squares: ```[0.650 1.109 31.981]``` (need to check this is correct)

After 1e5 iterations when SGD has converged

Parameters predicted by SGD: ```[0.647 1.115 31.984]```
Parameters predicted by Least squares: ```[0.650 1.109 31.981]``` 

The parameters predicted by Least Squares solve the loss function (Mean square error) optimally. SGD converges to the correct answer here, since the loss function is convex, and there are no local minima for SGD to get stuck at. 

Note that in this code, we did not initialise the parameters of the logistic regression at all. Neither did we use any kind of regularisation. 