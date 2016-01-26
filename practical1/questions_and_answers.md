Question 1
==

local t = torch.Tensor({{1,2,3},{4,5,6},{7,8,9}})

Write three commands to slice the middle column of this tensor

local col = t[{ {} {2} }]
local col = t[{ {1,-1}{2} }]
local col = t:t()[2]  -- Transpose the tensor, then extract the second row.

Question 2
==

What is the difference between a Tensor and a Storage?

The Torch Tensor class is contains a Torch Storage class as one its member variables. So a Tensor object is like an API to perform useful functions on a Storage object. The Storage class is essentially a way for Lua to access the memory of a C pointer or array. To access the Storage of a tensor object, t, type t:storage()

By default, when you copy a Torch tensor, 
ie if you have
local t1 = torch.Tensor(3,4) -- Will initialise a Tensor with random values (whatever is in memory)
local t2 = t1                -- Now the variable t2 will have the same Storage object as t1. Hence, a shallow copy has occured.

To perform a deep copy, you can clone a tensor

local t2 = t1:clone()
