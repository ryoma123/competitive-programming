a, b = gets.split.map(&:to_i)

num = a - b * 2
puts num >= 0 ? num : 0
