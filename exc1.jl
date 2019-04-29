# Let H be the Hadamard matrix (for the haddamard quantum gate):
# Verify that H * H = I where I is the 2x2 identity matrix

s = UniformScaling(1/sqrt(2))

println(s)

H = s * [1 1; 1 -1]

println(H)

Q = H * H

println(Q)
