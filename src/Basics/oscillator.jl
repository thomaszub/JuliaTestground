# dd(x) = -kx
# d(x, y) = (y, -kx) = (0, 1; -k, 0)(x, y)

using DifferentialEquations, Plots

function oscillator!(dx, x, p, t)
  dx[1] = x[2]
  dx[2] = -p[1] * x[1]
end

k = 0.25π^2 
ω = sqrt(k)
f = 2π/ω

T = [0, 4.0]
x0 = [1.0, 0.0]

prob = ODEProblem(oscillator!, x0, T, [k])
sol = solve(prob)

x(t) = x0[1]*cos(ω*t)

plot(sol)
plot!(sol.t, t -> x(t), label="exact", lw=3, seriestype=:scatter)
