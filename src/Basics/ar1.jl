using Distributions, Plots

a = 0.9
n = 200
x_0 = 0.0

normal = Normal()
ar(x) = a * x + rand(normal)

x_series = zeros(n)
x_series[1] = x_0

for id in 2:n
  x_series[id] = ar(x_series[id-1])
end

plot(1:n, x_series)
