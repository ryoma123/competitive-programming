a, b = gets.split.map(&:to_i)

i = (a + b) / 2
puts (a - i).abs == (b - i).abs ? i : 'IMPOSSIBLE'
