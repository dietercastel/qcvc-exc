include("./qcvc.jl")
using .QC
using Test

# Can you find and example of a 2x2 matrix that is unitary and is not I, X or H?

myUnitary = [ im 0 ; 0 im ]

Ans = adjoint(myUnitary) * myUnitary
println(Ans)

@testset "Exc 7" begin
	@test Ans == [1 0 ; 0 1]
end;
