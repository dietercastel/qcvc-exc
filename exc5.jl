include("./qcvc.jl")
using .QC

# Show that X is unitary

println(adjoint(X) * X)
