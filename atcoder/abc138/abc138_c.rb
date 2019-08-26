n = gets.to_i
a = gets.split.map(&:to_f)

a.sort!

while a.count >= 2
  x = a.shift
  y = a.shift
  a.unshift((x + y) / 2)
end
puts a[0]
