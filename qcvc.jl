module QC

export X,Y,Z,H, s1sqrt2

using LinearAlgebra

# Implementation of the Pauli Matrices

# Quantum not gate
X = [0 1 ; 1 0]

Y = [0 -im; im 0]

Z = [ 1 0 ; 0 -1]

# Hadamard Gate

s1sqrt2 = UniformScaling(1/sqrt(2))
H= s1sqrt2 * [1 1; 1 -1]

end
