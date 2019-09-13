n = gets.to_i

def koch(n, a, b)
  return if n == 0
  th = Math::PI * 60.0 / 180.0

  s = {
    x: (2.0 * a[:x] + 1.0 * b[:x]) / 3.0,
    y: (2.0 * a[:y] + 1.0 * b[:y]) / 3.0
  }
  t = {
    x: (1.0 * a[:x] + 2.0 * b[:x]) / 3.0,
    y: (1.0 * a[:y] + 2.0 * b[:y]) / 3.0
  }
  u = {
    x: (t[:x] - s[:x]) * Math.cos(th) - (t[:y] - s[:y]) * Math.sin(th) + s[:x],
    y: (t[:x] - s[:x]) * Math.sin(th) + (t[:y] - s[:y]) * Math.cos(th) + s[:y]
  }

  koch(n - 1, a, s)
  puts sprintf("%.8f %.8f", s[:x], s[:y])
  koch(n - 1, s, u)
  puts sprintf("%.8f %.8f", u[:x], u[:y])
  koch(n - 1, u, t)
  puts sprintf("%.8f %.8f", t[:x], t[:y])
  koch(n - 1, t, b)
end

a = {x: 0, y: 0}
b = {x: 100, y: 0}

puts sprintf("%.8f %.8f", a[:x], a[:y])
koch(n, a, b)
puts sprintf("%.8f %.8f", b[:x], b[:y])
