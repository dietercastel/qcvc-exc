include("./qcvc.jl")
using .QC
using Test
using LinearAlgebra 

# Takes two qubits (2x1) as input and returns the 2 qubit computational basis vector as output (1x4). 
one2two(a,b) = reshape(transpose(kron(a,transpose(b))), 2^2)
# Takes a 2-qubit state and a (1x2) as input and returns the 2 qubit computational basis vector as output (1x4). 
two2three(a,b) = reshape(transpose(kron(a,transpose(b))), 2^3)


iswhole(x) = round(x) == x 
@testset "wholeness" begin
	@test iswhole(1.0) == true
	@test iswhole(1.1) == false 
	@test iswhole(10.0) == true
	@test iswhole(10.9) == false 
	@test iswhole(-10.9) == false 
	@test iswhole(-10.0) == true 
	@test iswhole(3333333333.3) == false 
	@test iswhole(3333333333.0) == true 
end;


function isPow2len(v::Vector)
	dim1len = size(v)[1]
	return dim1len >= 2 && ispow2(dim1len) 
end

function isPow2len2(v::Vector)
	dim1len = size(v)[1]
	logLen = log2(dim1len)
	return logLen >= 1 && iswhole(logLen)
end

@time isPow2len([1;0;0;0;1;0;1;1])
@time isPow2len2([1;0;0;0;1;0;1;1])

@testset "isPow2len" begin
	@test isPow2len([]) == false
	@test isPow2len([1]) == false
	@test isPow2len([1;2]) == true 
	@test isPow2len([1;2;3]) == false 
	@test isPow2len([1;2;3;4]) == true 
	@test isPow2len([1;2;3;4;5]) == false 
	@test isPow2len([1;2;3;4;5;6;]) == false 
	@test isPow2len([1;2;3;4;5;6;7]) == false 
	@test isPow2len([1;2;3;4;5;6;7;8]) == true 
end;


# Extends the state of n qbits (length 2^n) with an extra qbit (of length 2)
# resulting in a new n+1 qbit state (length 2^n+1)
function extendState(qbits, newqbit)
	qbitslen = size(qbits)[1]
	#println(qbitslen)
	statedim = log2(qbitslen) 
	#println(statedim)
	println(size(qbits))
	println(length(size(qbits)))
	if !isPow2len(qbits) || length(size(qbits)) != 1
		println("in")
		throw(ArgumentError("First argument should be a column vector of size 2^nx1 where n is at least 1."))
	end
	if size(newqbit) != (2,)
		throw(ArgumentError("Second argument should be a column vector of size 2x1"))
	end
	return reshape(transpose(kron(qbits,transpose(newqbit))), 2*qbitslen)
end

e1_0 = [ 1; 0 ]
e1_1 = [ 0; 1 ]
println(size(one2two(e1_0,e1_1)))
println(one2two(ketPlus,ketMin))

###
#
#  1 - H - | - > ---.------- ?? H - m =
#					| CNOT
#  1 - H - | - > ---0------- ?? H - m =
###



res = H * e1_1
println(res)
println(length(res))
println(size(res))
res = one2two(H * e1_1,H * e1_1)
println(res)
println(length(res))
println(size(res))

println(two2three(res,e1_0))


v2 = [1 ; 0]
v3 = [ 1; 2; 3 ]
v4 =  [0; 1; 0; 0]
v4x2 =  [0 2; 1 2; 0 2; 0 2]

@testset "invalidsizes" begin
	@test_throws ArgumentError extendState(v4,v4) 
	@test_throws ArgumentError extendState(v4x2,v2) 
	@test_throws ArgumentError extendState(v2,v4) 
	@test_throws ArgumentError extendState(v3,v2) 
end;

println("stuff")

println(extendState(ketPlus,ketMin) .== [0.5; -0.5; 0.5; -0.5])
println(bitstring(0.5))
println(extendState(ketPlus,ketMin)[1])
println(bitstring(extendState(ketPlus,ketMin)[1]))
println(bitstring(extendState(ketPlus,ketMin)[2]))
println(bitstring(extendState(ketPlus,ketMin)[3]))

@testset "extendState to two qubits" begin
	@test size(extendState(e1_0,e1_1)) == (4,) 
	@test extendState(e1_0,e1_1) == [0; 1; 0; 0]
	@test size(extendState(e1_0,e1_0)) == (4,) 
	@test extendState(e1_0,e1_0) == [1; 0; 0; 0]
	@test size(extendState(e1_1,e1_0)) == (4,) 
	@test extendState(e1_1,e1_0) == [0; 0; 1; 0]
	@test size(extendState(e1_1,e1_1)) == (4,) 
	@test extendState(e1_1,e1_1) == [0; 0; 0; 1]
	pm = extendState(ketPlus,ketMin)
	@test size(pm) == (4,) 
	@test isapprox(pm,[0.5; -0.5; 0.5; -0.5])
	@test isapprox(norm(pm),1)
	@test size(one2two(ketPlus,ketPlus)) == (4,) 
	@test isapprox(one2two(ketPlus,ketPlus),[0.5; 0.5; 0.5; 0.5])
	@test size(one2two(ketMin,ketPlus)) == (4,) 
	@test isapprox(one2two(ketMin,ketPlus),[0.5; 0.5; -0.5; -0.5])
	@test size(one2two(ketMin,ketMin)) == (4,) 
	@test isapprox(one2two(ketMin,ketMin),[0.5; -0.5; -0.5; 0.5])
end;
#=
	@test typeof(one2two(ketPlus,ketMin)) == typeof([0.5; -0.5; 0.5; -0.5])
	@test size(one2two(ketPlus,ketPlus)) == (4,) 
	@test one2two(ketPlus,ketPlus) == [0.5; 0.5; 0.5; 0.5]
	@test size(one2two(ketMin,ketPlus)) == (4,) 
	@test one2two(ketMin,ketPlus) == [0.5; 0.5; -0.5; -0.5]
	@test size(one2two(ketMin,ketMin)) == (4,) 
	@test one2two(ketMin,ketMin) == [0.5; -0.5; -0.5; 0.5]
end; 
=#
