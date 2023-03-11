using Distributions, Expectations

normal = Normal()

E = expectation(normal)

E(x -> x)
E(x -> x^2)
E(x -> x^3)
E(x -> x^4)