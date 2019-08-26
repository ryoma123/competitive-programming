n = gets.to_i
a = gets.split.map(&:to_i)

puts Rational(1, a.map {|i| Rational(1, i) }.inject(:+)).to_f
