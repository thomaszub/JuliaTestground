x = [1.0, 0.5, 0.75]
y = [2.0, 1.5, -1.5]

for (i, (xi, yi)) in enumerate(zip(x, y))
  println("i=$(i): xi * yi^i = $(xi) * $(yi)^$(i) = $(xi*yi^i)")
end

A = [1.0 -1.0 0.0; -1.0 1.0 0.0; 0.0 0.0 1.0]
b = 2.5

z = A*x .+ b

a1 = "Hello"
a2 = "World"

a1 * a2

Base.:+(a::String, b::String) = a * b

a1 + a2

0.95 * 0.01 / (0.95 * 0.01 + 0.005 * 0.99)