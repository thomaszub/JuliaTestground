using Plots

function logistic_gen(r)
  return x -> r * x * (1.0 - x)
end

r = 0.9:0.005:3.8
n_iter = 20000
n_sample = 2000
result = zeros(2, size(r)[1] * n_sample)

for i in 1:size(r)[1]
  logistic = logistic_gen(r[i])
  x_curr = 0.1
  for j in 1:n_iter
    x_curr = logistic(x_curr)
    idx = j - n_iter + n_sample
    if idx > 0
      result[1, idx+(i-1)*n_sample] = r[i]
      result[2, idx+(i-1)*n_sample] = x_curr
    end
  end
end

histogram2d(result[1, :], result[2, :], bins=(size(r)[1], 200), c=:blues, xlabel="r", ylabel="x", title="Bifurcation diagram", legend=false)
