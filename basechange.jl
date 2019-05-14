include("./qcvc.jl")
using .QC
using Test

# Takes two qubits (1x2) as input and returns the 2 qubit computational basis vector as output (1x4). 
one2two(a,b) = reshape(transpose(kron(a,transpose(b))), 4)


e1_0 = [ 1; 0 ]
e1_1 = [ 0; 1 ]
println(size(one2two(e1_0,e1_1)))
println(one2two(ketPlus,ketMin))

@testset "tests" begin
	@test size(one2two(e1_0,e1_1)) == (4,) 
	@test one2two(e1_0,e1_1) == [0; 1; 0; 0]
	@test size(one2two(e1_0,e1_0)) == (4,) 
	@test one2two(e1_0,e1_0) == [1; 0; 0; 0]
	@test size(one2two(e1_1,e1_0)) == (4,) 
	@test one2two(e1_1,e1_0) == [0; 0; 1; 0]
	@test size(one2two(e1_1,e1_1)) == (4,) 
	@test one2two(e1_1,e1_1) == [0; 0; 0; 1]
	@test size(one2two(ketPlus,ketMin)) == (4,) 
	@test one2two(ketPlus,ketMin) == [0.5; -0.5; 0.5; -0.5]
	@test size(one2two(ketPlus,ketPlus)) == (4,) 
	@test one2two(ketPlus,ketPlus) == [0.5; 0.5; 0.5; 0.5]
	@test size(one2two(ketMin,ketPlus)) == (4,) 
	@test one2two(ketMin,ketPlus) == [0.5; 0.5; -0.5; -0.5]
	@test size(one2two(ketMin,ketMin)) == (4,) 
	@test one2two(ketMin,ketMin) == [0.5; -0.5; -0.5; 0.5]
end; 
