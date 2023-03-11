using DifferentialEquations, Plots

function SIR!(dx, x, p, t)
  dx[1] = -p[1] * x[1] * x[2]
  dx[2] = p[1] * x[1] * x[2] - p[2] * x[2]
  dx[3] = p[2] * x[2]
end

x0 = [0.99, 0.01, 0.0]
p = [0.15, 0.07]

prob = ODEProblem(SIR!, x0, [0.0, 200.0], p)
sol = solve(prob)

plot(sol)