using Plots, LinearAlgebra, LaTeXStrings, Distributions
import ColorSchemes: Paired_12
colors = Paired_12[[1,2,7,8,3,4,5,6,9,10]]
gr(xguidefontsize = 12, yguidefontsize = 12, xtickfontsize=10, ytickfontsize=10, 
    titlefontsize = 12, legendfontsize = 14, lw = 4, grid = false)

figFolder = "/home/mv/Dropbox/Webpage/GithubPages/mattiasvillani.github.io/images/courses/"

""" 
    SimDirProcess(P₀, α, ϵ) 

Simulates one realization from the Dirichlet Process DP(α⋅P₀) using the Stick-breaking construction.

ϵ>0 is the remaining stick length when the simulation terminates. 

# Examples
```julia-repl
julia> θ, π = SimDirProcess(Normal(), 2, 0.001)
julia> plot(θ, cumsum(π), linetype = :steppost, label = nothing, xlab = "θ", ylab = "F(θ)")
```
""" 
function SimDirProcess(P₀, α, ϵ)
    remainStickLength = 1
    θ = Float64[];
    π = Float64[];
    while remainStickLength > ϵ
        θₕ = rand(P₀)
        Vₕ = rand(Beta(1, α))
        πₕ = Vₕ*remainStickLength
        remainStickLength = remainStickLength*(1-Vₕ) 
        push!(θ, θₕ)
        push!(π, πₕ)
    end
    sortIdx = sortperm(θ)
    return θ[sortIdx], π[sortIdx]
end

# Evaluate a step CDF function at any point
function f(θₕ, θ, π) 
    cdfFunc = [0;cumsum(π);1]
    θ = [-Inf;θ;maximum(θ)]
    return cdfFunc[findlast(θ .<= θₕ)]
end

θ, π = SimDirProcess(Normal(), 2, 0.001)
plot(θ, cumsum(π), linetype = :steppost)

α = 10
θgrid = -3:0.01:3
nSim = 10000
DPdraws = zeros(length(θgrid), nSim)
for i = 1:nSim
    θ, π = SimDirProcess(Normal(), α, 0.001)
    DPdraws[:,i] = [f(θₕ, θ, π) for θₕ in θgrid]
end
quantDP = zeros(length(θgrid),5)
for i = 1:length(θgrid)
    quantDP[i,:] = quantile(DPdraws[i,:],[0.025,0.1,0.5,0.9, 0.975])
end
plot(θgrid, quantDP[:,3], fillrange = quantDP[:,1], fillalpha = 0.35, color = colors[1], label = nothing, legend = nothing)
plot!(θgrid, quantDP[:,3], fillrange = quantDP[:,5], fillalpha = 0.35, lw = 0, color = colors[1], label = "95% probability interval")
plot!(θgrid, quantDP[:,3], fillrange = quantDP[:,2], fillalpha = 0.35, color = colors[1], label = nothing)
plot!(θgrid, quantDP[:,3], fillrange = quantDP[:,4], fillalpha = 0.35, lw = 0, color = colors[1], label = "80% probability interval")
plot!(θgrid, quantDP[:,3], color = colors[2], label = "median")
plot!(θgrid, DPdraws[:,1], color = colors[4], lw = 2)

savefig(figFolder*"abl.png")