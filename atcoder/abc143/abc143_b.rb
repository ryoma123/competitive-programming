n = gets.to_i
a = gets.split.map(&:to_i)

puts a.combination(2).to_a.map{|a, b| a * b }.inject(:+)
