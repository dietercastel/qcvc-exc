module QC

export X,Y,Z,H, s1sqrt2, ketPlus, ketMin

using LinearAlgebra

# Implementation of the Pauli Matrices

# Quantum not gate for single qubit
X = [0 1 ; 1 0]

Y = [0 -im; im 0]

Z = [ 1 0 ; 0 -1]

# Hadamard Gate

s1sqrt2 = UniformScaling(1/sqrt(2))
H= s1sqrt2 * [1 1; 1 -1]


ketPlus = s1sqrt2 * [1 ; 1]
ketMin = s1sqrt2 * [1 ; -1] 

# two-qubit gate:

CNOT = [1 0 0 0 ; 0 1 0 0 ; 0 0 0 1 ; 0 0 1 0 ]

end
