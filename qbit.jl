using Test
using LinearAlgebra 


#struct BaseState{T<:Real} <: Vector{Complex{T}} where {T<:Real}
struct BaseState{T<:Real}
	size::Int
	state::Vector{Complex{T}}
	function BaseState{T}(s::Int, v::Vector{Complex{T}}) where {T<:Real}
		if length(v) !== 2^s
			throw(ArgumentError("Size parameter should correspond to the length of the provided vector."))
		end
		if !isPow2len(v)
			throw(ArgumentError("Invalid base state length, not a power of 2"))
		end
		if !isapprox(norm(v),1)
			throw(ArgumentError("The base state vector should have euclidean 2-norm equal to 1"))
		end
		new{T}(s,v)
	end
	function BaseState(x::Int) 
		if x === 0 
			new(1,[complex(1,0);complex(0,0)])
		elseif x === 1
			new(1,[complex(0,0);complex(1,0)])
		else
			throw(ArgumentError("Invalid base state, use 0 or 1"))
		end
	end
	#=
	function BaseState{T}(v::Vector{Complex{T}}) where {T<:Real}
		if !isPow2len(v)
			throw(ArgumentError("Invalid base state length, not a power of 2"))
		end
		new(log2(v),v)
	end
	=#
end


iswhole(x) = round(x) == x 

function isPow2len(v::Vector)
	dim1len = length(v) 
	return dim1len >= 2 && ispow2(dim1len) 
end

function isPow2len2(v::Vector)
	dim1len = size(v)[1]
	logLen = log2(dim1len)
	return logLen >= 1 && iswhole(logLen)
end

function isPow2len3(v::Vector)
	dim1len = size(v)[1]
	return dim1len >= 2 && ispow2(dim1len) 
end

@time isPow2len([1;0;0;0;1;0;1;1])
@time isPow2len2([1;0;0;0;1;0;1;1])
@time isPow2len3([1;0;0;0;1;0;1;1])

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

a = BaseState(1)
b = BaseState(1,[1+0im;0+0im])
# The 1-qbit zero base state
#a = BaseState(2,"01")

println(a)
println(b)

@testset "1-qbit tests" begin
	@test BaseState(0) === BaseState(1,[1;0])
	@test BaseState(0).size === 1 
	@test BaseState(1) === BaseState(0,[0;1])
	@test BaseState(1).size === 0 
	@test_throws ArgumentError BaseState(2)
end

