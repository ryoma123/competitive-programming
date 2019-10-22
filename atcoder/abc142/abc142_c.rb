n = gets.to_i
a = gets.split.map(&:to_i)

o = Array.new(n)

(0...n).each do |i|
  o[a[i] - 1] = i + 1
end
puts o.join(' ')
