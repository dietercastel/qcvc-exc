# Excercise 3:
# Consider the following quantum circuit:
# | \psi > ---| H |---| X |---

# Quantum not gate
X = [0 1 ; 1 0]

# Quantum Hadamard Gate
s = UniformScaling(1/sqrt(2))
H = s * [1 1 ; 1 -1]

#Explain why the output from this circuit is XH|\psi\rangleXH∣ψ⟩, not HX|\psi\rangleHX∣ψ⟩, as you might naively assume if you wrote down gates in the order they occur in the circuit.

# Answer: 

# If we want to apply the circuit to some quantum state Psi e.g.:  

Psi = s * [ 1 ; -1]

# We have to apply the function of the first port starting from left-to-right

PartialAns = H * Psi

# The following port is X, and using linear function application (matrix multiplication) to the partial answer we get:

Ans = X * PartialAns # 

println(Ans)
println(X * H * Psi)
