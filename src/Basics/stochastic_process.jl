using Plots, Statistics

function process_gen(μ, σ)
  function process(x)
    ξ = randn(Float64)
    return μ(x) + σ(x) * ξ
  end
  return process
end

function gen_series(process, x0, n)
  x = zeros(n)
  x_curr = x0
  for i in 1:n
    x_curr = process(x_curr)
    x[i] = x_curr
  end
  return x
end

process_func = process_gen(x -> x, x -> sqrt(0.15 + 0.05 * x^2))

n = 200

y = gen_series(process_func, 0.0, n)

mean(y)
std(y)

plot(1:n, y)