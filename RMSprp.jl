abstract type DescentMethod end

mutable struct RMSProp <: DescentMethod
    α # learning rate
    γ # decay
    ϵ # small value
    s # sum of squared gradient
end

f(x) = x^4 - 14 * x^3 + 60 * x^2 - 70 * x
function step!(f, ∇f, x)
    g = ∇f(x)
    α = 0.1
    γ = 1
    ϵ = 0.001
    s = 1

    s = γ * s + (1 - γ) * (g * g)
    return x - α * g ./ (sqrt.(s) .+ ϵ)
end

using Flux
x = 0.3
∇f(x) = gradient(f, x)[1];

step!(f, ∇f, x)
