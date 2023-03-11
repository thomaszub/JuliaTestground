# A = π 0.5^2 <=> π = 4 A

max_iter = 5e7

hit = 0

for i in 1:max_iter
  pic = sum(rand(Float64, 2).^2)
  if pic < 1.0
    hit += 1
  end
end

pi_num = 4.0 * Float64(hit / max_iter)
