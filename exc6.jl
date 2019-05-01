include("./qcvc.jl")
using .QC

# Show that the identity matrix is unitary

I = [1 0; 0 1]

println(adjoint(I) * I)
