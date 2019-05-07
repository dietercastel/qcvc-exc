include("./qcvc.jl")
using .QC
using Test
using .Base

# Given the following circuit:
#  --| H |--| m D= 

# Show that for quantum states sp
sp = s1sqrt2 * [ 1 ; 1 ]
# The output is m=0 with probability 1

# And for quantum state sm:
sm = s1sqrt2 * [ 1 ; -1 ]
# The output is m=1 with probability 1

Ans1 = H * sp
println(Ans1)
Ans2 = H * sm 
println(Ans2)


ketzero = [1 ; 0 ]
ketone =  [0 ; 1 ]

# Due to numerical errors this calculation is not exactly the same
println("Numerical difference as shown:")
println(Ans1[1])
println(bitstring(Ans1[1]))
println(ketzero[1])
println(bitstring(ketzero[1]))
println(Ans1[2])
println(bitstring(Ans1[2]))
println(ketzero[2])
println(bitstring(ketzero[2]))
@testset "Exc4" begin
	#Rounding resolves the numerical issue.
	@test map(x->round(x),Ans1) == ketzero 
	@test map(x->round(x),Ans2) == ketone 
end;
