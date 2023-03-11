using QuadGK

f(x) = ℯ^x

val, tol = quadgk(f, 0.0, 1.0)

println("exact: $(ℯ - 1), numeric: $(val)")