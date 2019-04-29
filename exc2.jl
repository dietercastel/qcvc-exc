s = UniformScaling(1/sqrt(2))

println(s)

J = s * [1 1; 1 1]

println(J)

V = s * [ 1 ; -1]

println(V)

Q = J * V

println(Q)

# Q becomes an unnormalized vector with length 0 (instead of 1) which is no longer a valid state vector.
