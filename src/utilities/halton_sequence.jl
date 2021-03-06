"""
  `haltonsequence(b, n)`

  Generate the first `n` numbers in Halton's sequence with base `b`.
"""
function haltonsequence(b, n)
  map((i) -> haltonnumber(b, i), 1:n)
end

"""
  `haltonnumber(base, index)`

  Generate the `n`-th Halton number in the sequence with base `b`.

# Note
  Implementation is based on the psudo code in:
    http://en.wikipedia.org/wiki/Halton_sequence
"""
function haltonnumber(base, index)
  res = 0
  f = 1 / base
  i = index

  while (i > 0)
    res += f * (i % base)
    i = ifloor(i / base)
    f = f / base
  end

  return res
end
