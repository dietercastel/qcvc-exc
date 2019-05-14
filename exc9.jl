include("./qcvc.jl")
using .QC
using Test


# Can you find single-qubit states  | alpha > and | beta > so that applying a CNOT to the combined state | alpha beta > changes the first qubit?


# Define 2 qubit basis states:

oo = [ 1 ; 0 ; 0 ; 0]
oi = [ 0 ; 1 ; 0 ; 0]
io = [ 0 ; 0 ; 1 ; 0 ]
ii = [ 0 ; 0 ; 0 ; 1 ]


# Define CNOT

CNOT = [1 0 0 0 ; 0 1 0 0 ; 0 0 0 1 ; 0 0 1 0 ]

println(CNOT)

@testset "CNOT definition" begin
	@test CNOT*oo == oo
	@test CNOT*oi == oi
	@test CNOT*io == ii
	@test CNOT*ii == io
end;


tst = [ 1/sqrt(2) ; 1/sqrt(2) ; 1/sqrt(2) ; -1/sqrt(2) ]
tst2 = [ 1/2 ; -1/2 ; 1/2 ; -1/2 ]

println(tst2)
println(CNOT*tst2)
println(CNOT*CNOT*tst2)

println("old")
println(tst)
println(CNOT*tst)
println(CNOT*CNOT*tst)
