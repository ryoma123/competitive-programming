def cutbar(n, m, c)
  return 0 if c >= n

  if c < m
    1 + cutbar(n, m, c * 2)
  else
    1 + cutbar(n, m, c + m)
  end
end

puts cutbar(20, 3, 1)
puts cutbar(100, 5, 1)
