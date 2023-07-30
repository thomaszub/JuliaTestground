softmax(x) = exp.(x)./sum(exp.(x), dims=2)

function scaledDotProduct(q::AbstractMatrix{T}, k::AbstractMatrix{T}, v::AbstractMatrix{T}) where {T}
  return softmax(q * k'/sqrt(size(k)[1])) * v
end

q = [1.0 0.0; 0.0 1.0]
k = [-1.0 1.0; 1.0 -1.0]
v = [1.0 2.0; 3.0 6.0]

scaledDotProduct(q, k, v)
