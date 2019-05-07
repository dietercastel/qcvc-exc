include("./qcvc.jl")
using .QC
using Test

# Show that the identity matrix is unitary

I = [1 0; 0 1]

Ans = adjoint(I) * I
println(Ans)

@testset "Exc 6" begin
	@test Ans == I
end;
