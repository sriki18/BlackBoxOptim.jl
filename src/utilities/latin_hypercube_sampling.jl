"""
  Randomly sample `numSamples` values from the parallelogram defined
  by `mins` and `maxs` using the Latin hypercube algorithm.
"""
function latin_hypercube_sampling(mins, maxs, numSamples)
  dims = length(mins)
  result = zeros(numSamples, dims)
  for(i in 1:dims)
    interval_len = (maxs[i] - mins[i]) / numSamples
    samples_for_dim = linspace(mins[i], maxs[i] - interval_len, numSamples) +
                      interval_len*rand(numSamples)
    result[:,i] = samples_for_dim[shuffle(collect(1:numSamples))]
  end
  return result'
end
