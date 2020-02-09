s, _ = gets.split.map(&:to_s)
a, b = gets.split.map(&:to_i)
u = gets.chomp

if s == u
  puts [a - 1, b].join(' ')
else
  puts [a, b - 1].join(' ')
end
