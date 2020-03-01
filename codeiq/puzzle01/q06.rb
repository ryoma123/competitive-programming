def check(n)
  c = n * 3 + 1

  while c != 1
    c = c.odd? ? c * 3 + 1 : c / 2
    return true if c == n
  end
  false
end

puts (2..10000).step(2).count{|i| check(i) }
