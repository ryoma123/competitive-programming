n = gets.to_i

f = n.odd? ? (n / 2 + 1).to_f / n : (n / 2).to_f / n
puts sprintf("%.10f", f)
