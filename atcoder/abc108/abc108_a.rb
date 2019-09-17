n = gets.to_i

half = n / 2

if n.odd?
  puts half * (half + 1)
else
  puts half ** 2
end
