using LinearAlgebra, Plots

function rot(ϕ)
  cosp = cos(ϕ)
  sinp = sin(ϕ)
  return [cosp -sinp; sinp cosp]
end

ϕ = π/180 * 90

rotMat = rot(ϕ)

x = [1.0, 1.0]

y = rotMat * x

det(rotMat)

function ts(x)
  return [x[1]], [x[2]]
end

scatter(0, 0, label="origin", xlims=(-1.1, 1.1), ylims=(-1.1, 1.1), x)
scatter!(ts(x), label="x")
scatter!(ts(y), label="y")

