using Plots, Statistics

function process_gen(μ::Function, σ::Function)
  function process(x, dt)
    ξ = randn(Float64)
    return x + μ(x) * dt + σ(x) * ξ * sqrt(dt)
  end
  return process
end

function gen_series(process, x0, n, dt)
  x = zeros(n)
  x_curr = x0
  for i in 1:n
    x_curr = process(x_curr, dt)
    x[i] = x_curr
  end
  return x
end

μ = 0.05
σ = 0.05
x0 = 10.0
n = 200
dt = 0.01

process_func = process_gen(x -> μ * x, x -> σ * x)
y = gen_series(process_func, x0, n, dt)

plot((1:n)*dt, y)

# https://en.wikipedia.org/wiki/Black–Scholes_equation
