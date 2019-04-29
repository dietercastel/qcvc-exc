# Exercise 2:
# Assume that instead of the Hadamard matrix we define J as follows:

using LinearAlgebra

s = UniformScaling(1/sqrt(2))
J = s * [1 1; 1 1]

println(J)

# What happens if we apply J to the quantum state V:

V = s * [ 1 ; -1]

println(V)

# Answer: 
Ans = J * V

println(Ans)

# Ans becomes an unnormalized vector with length 0 (instead of 1) which is no longer a valid state vector. Hence using J  as a port would not work because it would collapse the quantum state and not allow for any further computation. 
