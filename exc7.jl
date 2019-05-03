include("./qcvc.jl")
using .QC

# Can you find and example of a 2x2 matrix that is unitary and is not I, X or H?

myUnitary = [ im 0 ; 0 im ]

println(adjoint(myUnitary) * myUnitary)
