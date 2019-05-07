include("./qcvc.jl")
using .QC
using Test

# Show that Y and Z are indeed unitary

@testset "Exc 8: Unitarity of Y & Z" begin
	@test adjoint(Y)*Y == [1 0 ; 0 1]
	@test adjoint(Z)*Z == [1 0 ; 0 1]
end;
