include("./qcvc.jl")
using .QC
using Test

# Show that X is unitary

Ans = adjoint(X) * X
println(Ans)

@testset "Exc 5" begin
	@test Ans == [1 0 ; 0 1]
end;
