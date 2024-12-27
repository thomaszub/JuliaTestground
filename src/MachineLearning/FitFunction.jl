using Lux, Optimisers, Plots, Random, Zygote

rng = Random.default_rng()
Random.seed!(rng, 42)

μ = 0.5
σ = 0.125
y(x) = 1.0/sqrt(2.0 * π * σ^2) * exp(-0.5 * (x - μ)^2/σ^2)

optim = Adam()

function loss_fn(model, params, state, data)
  ym, state = Lux.apply(model, data[1], params, state)
  loss = Lux.mean(abs2, ym .- data[2])
  return loss, state, ()
end

vjp_rule = Lux.Training.AutoZygote()

x = 0.0:0.005:1.0
data = (reshape(x, 1, :), reshape(map(y, x), 1, :))

model = Chain(Dense(1 => 128, Lux.tanh), Dense(128 => 1))
ps, st = Lux.setup(rng, model)
tstate = Lux.Training.TrainState(model, ps, st, optim)

for epoch in 1:5000
  _, loss, _, tstate = Lux.Training.single_train_step!(vjp_rule, loss_fn, data, tstate)
  @info epoch=epoch loss=loss
end

ypred_m, _ = Lux.apply(model, reshape(x, 1, :), tstate.parameters, tstate.states)
ypred = reshape(ypred_m, :)

plot(x, y)
plot!(x, ypred)
