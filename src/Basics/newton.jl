using ForwardDiff

function newton(f, x_0, tolerance, maxiter)
  x = x_0
  diff = Inf
  for iter in 1:maxiter
    x_new = x - f(x)/ForwardDiff.derivative(f, x)
    diff = abs(x_new - x)
    x = x_new
    if diff < tolerance
      return x, iter
    end
  end
  return x, maxiter
end

f(x) = (x - 1.0)^3

x, iter = newton(f, 2.0, 1e-9, 1000)