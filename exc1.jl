# Exercise 1:
# Let H be the Hadamard matrix (for the hadamard quantum gate):

s = UniformScaling(1/sqrt(2))

println(s)

H = s * [1 1; 1 -1]

println(H)

# Verify that H * H = I where I is the 2x2 Identity matrix

Ans = H * H

println(Ans)

# Indeed this results in Ans being the Idenity matrix [1 0; 0 1]
