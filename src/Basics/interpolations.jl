using Interpolations, Plots

x_fine = 0:0.1:7
x_coarse = 0:0.5:7

y_fine = sin.(x_fine)
y_coarse = sin.(x_coarse)

linear = linear_interpolation(x_coarse, y_coarse)
cubic = cubic_spline_interpolation(x_coarse, y_coarse)

plot(x_fine, y_fine, label="fine")
scatter!(x_coarse, y_coarse, label="coarse")
plot!(x_fine, linear.(x_fine), label="linear")
plot!(x_fine, cubic.(x_fine), label="cubic")
