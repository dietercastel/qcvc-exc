module QC

export X,H, s1sqrt2

using LinearAlgebra

# Quantum not gate
X = [0 1 ; 1 0]

# Hadamard Gate

s1sqrt2 = UniformScaling(1/sqrt(2))
H= s1sqrt2 * [1 1; 1 -1]

end
