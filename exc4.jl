include("./qcvc.jl")
using .QC

# Given the following circuit:
#  --| H |--| m D= 

# Show that for quantum states sp
sp = s1sqrt2 * [ 1 ; 1 ]
# The output is m=0 with probability 1

# And for quantum state sm:
sm = s1sqrt2 * [ 1 ; -1 ]
# The output is m=1 with probability 1

println(H * sp )
println(H * sm )
