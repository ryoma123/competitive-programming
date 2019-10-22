n, k = gets.split.map(&:to_i)
h = gets.split.map(&:to_i)

puts h.select{|i| i >= k }.size
